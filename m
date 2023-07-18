Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1093F757977
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 12:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD2F10E02D;
	Tue, 18 Jul 2023 10:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6716310E02D;
 Tue, 18 Jul 2023 10:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpFLSGAG7H8c8KHLlNc+AR5KXiW6GZZJhldCRjAmeevnyCfKL5ZqQUtEKlaVH7i6ynMQPwp4A4MqpcUQoOqkOimXZLxkTVE29t0+6KfrZmbAJorIPNpxLurPcZBO0CBAEwZqrSlWGuh+xfA/y45qnXwbuiEoCQ6Qr+xNGpfg9AU6p3/4t0/JVcXqDOHONs2YKPQPrfD/5Ctd05rnVoU6rOezKtpaN7da5yqELztfznT0QOG/v4nh/6s742ZJVQa17Q0lvzWdECHVXhlv5+6J0/mZMjyqLVB/3sqBX2bb6IDmqScQs0rE8sFjO+HuvegSB1sPfM+hwXZ2NLLgZZK3eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcr3Vtqtkzjj0pRV8smZmOXgARZYzzMhS1QVcdFXGEA=;
 b=frhCCcF7f38u75g2SOla+MwOWU/VYLE7K9GVQvlJyfMoyKGqmH1+eKZOLNDJJ3bmbpRaN38e2LHpidltzb3WEmKcOz9rao1GuP1m/DHSLYOOVi2rX+U1s03zUSWjaCFR/eA1hAjXKjvw+7STR4JBVRP6/IsuAfYG8T6uyTGH7+/lkpsgPxtFX80GCIMGyHXmZX5LZYzWazNKW1DAtdt89BF4F0xfg8ILm8R3mNqApyVUaICHUPTp2MhUovpWt4VXiZBT/x52oZqhB8eCfry0TpYPZTSF59kB9ldSO4Ua7VTV/YrDDrZbM286fbWYCxG7ewQBnQ1ZdxVMYQBAiIkd1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcr3Vtqtkzjj0pRV8smZmOXgARZYzzMhS1QVcdFXGEA=;
 b=xu6w3qkj8cX8JecYw1QvNAyJFmYp5xp9WmpwZYsyEeTfNs0HT9hxjaGPtaIYm6yZ/rKqJerC8ex428mHG8HSDHUUCdSR9bd/aqicIwILO89oYQOZmNlYY5I+GbkeuuTW2c8AQcwTVYLnJF4kO+fmQICS5zSuRqhbwsKvuuNBfTA=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM4PR12MB6590.namprd12.prod.outlook.com (2603:10b6:8:8f::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Tue, 18 Jul 2023 10:46:19 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::93dc:de92:88e7:b765]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::93dc:de92:88e7:b765%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 10:46:18 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: RE: [PATCH V6 1/9] drivers core: Add support for Wifi band RF
 mitigations
Thread-Topic: [PATCH V6 1/9] drivers core: Add support for Wifi band RF
 mitigations
Thread-Index: AQHZswnuaUrcGkEUvkO69ZFpbKmfV6+2xnYAgAiUksA=
Date: Tue, 18 Jul 2023 10:46:18 +0000
Message-ID: <DM6PR12MB2619CF4D4601864FF251A1FAE438A@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230710083641.2132264-1-evan.quan@amd.com>
 <20230710083641.2132264-2-evan.quan@amd.com>
 <5439dd61-7b5f-4fc9-8ccd-f7df43a791dd@lunn.ch>
In-Reply-To: <5439dd61-7b5f-4fc9-8ccd-f7df43a791dd@lunn.ch>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=c46d6dbb-6e0d-404d-b843-ee57cf50ff7c;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-18T10:13:53Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|DM4PR12MB6590:EE_
x-ms-office365-filtering-correlation-id: b40242d9-5fb4-44d6-42b6-08db877c37fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8t92Rsuhc5R2yZGTjAO2Ow8HbMuEClfJApRn4LK4u0z3Rqphd1iCDw6CpNdiGpDUXsXmcFo3rDZk3CD4b0nCD1gusq7Z98G53eo2RvSChope9mnpJC1ogLaUmj6HYY4QoYAE3RIzqYdR3ER9ZN/zID/i3Ck92UbPCtST5nALJpfHQcKmH1joRr1V4ohvPG2qPVWY8YvGZOuSnndw+9K4kigFuf792DimP4SnhG5Gbx28l8ofrFwOp4t6i0U77ijrD3FZUXz3JvB6CE1EJGQqgTpHO6AH8M/fJOclFMQBGYx82Fa2LaLWMPDhaeW/nG7cwPZqmkrW8RUj8ZRKdWuVpBVUREw4IQQ4JXgsocq09hxFIGJTH5BaakeR3RjQj7PU8V3dUrsOqbyW6X4Sb0Mzb9ob/dEaM+DCnPeYZPMVkyIK60Ek7XaYfBATS9fhL4OEi62d8h+80wNDDrD8unNwez34nM8vUlArvdsFfi7eiEdvtYGl+IouNcyB8k3LhSacwV385K2T2N/tf0zyMf/zFGS7jsDQD6XBrcelOjZ8YCnE8NvL3/P8MG5845b+DrFYkMDTest9NTEYByRRfzbzxkGFCz0Qc8LInrw5CBvWFIayLFbeVGnFWcjFCG+NuxoW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(86362001)(2906002)(38070700005)(66476007)(5660300002)(66446008)(66556008)(64756008)(41300700001)(4326008)(7416002)(52536014)(8936002)(8676002)(66946007)(6916009)(76116006)(38100700002)(316002)(186003)(54906003)(122000001)(6506007)(478600001)(53546011)(26005)(83380400001)(33656002)(71200400001)(55016003)(7696005)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VXF9UNMesaWFGVtpR4kZWH+2etKDE3O8v/6sgexasbS153EKqSnkiBvh++Ev?=
 =?us-ascii?Q?A92QlZUJVt/T0gpihwd+hdWn3MbmK/zruDhR7kL5A64fWePTqIsUfUz+Iu/f?=
 =?us-ascii?Q?tUn1wQazzuz4Fh2OuuF1wDbyZhJPgZIezDsdqB310TGhiIt+wVfd1Zlm+ymd?=
 =?us-ascii?Q?6qfC580uACqd6vegBXyqP4LpdCRdfRDI8WqRVYazGB1RN+8l4U8bnMTWFTtQ?=
 =?us-ascii?Q?9CTeWwQKjcN+yrxQQOZYRAs922X7xtCICoW7KhFTvIk8Ab+nxlNZogSRu32s?=
 =?us-ascii?Q?S7desVgX+NdVuZTwmHpY5tvNzIhAVMD9LoEPJFE4rXbWC3WgMrB3woxbQfLS?=
 =?us-ascii?Q?m3FwlgMEgP1hQRk/s481AgkAfuV/BAj7CfBp1GZh1GqRb+6iR1nRyJxHUsh4?=
 =?us-ascii?Q?VPjtM8+sg5Lijvjnasy/ZZuGMBXjHJ0jgxDt931EajpYiHZGU/xwoqqUOdDS?=
 =?us-ascii?Q?8bt/061QoM94FxEys8mLaDVzcesqX7v1L12jg/p2KEqIpcUEPf+2vt7QFVjF?=
 =?us-ascii?Q?+ks57oLLXnO+CoIaV4LkGXXX8HxojiZONAYQTrETFhhiM7KNQNtsjxZiolJA?=
 =?us-ascii?Q?8Np6r1aGFkZzuW5fkN79kwtXOU/Bs/R8bQ3WhtKxJGEOm6sRAL33RVOW+fvw?=
 =?us-ascii?Q?B34mZjFRP+kp0puBcESAeUMCcprdMA6hDuRPmsKwGMoWVC7PcrHP2F0ls6wg?=
 =?us-ascii?Q?yUs1NQI+REJ41VFNcnqo7/rt11M/ewgzFX+dL//ppvBkkFGfvrG/KE+agRB/?=
 =?us-ascii?Q?0Qh0n3iHTL8isWBVqrl4ibJD53UX/6hx0Xk80jGSFIMTwgz7oDriukF5mpM7?=
 =?us-ascii?Q?o+An54x9Td5tSV3WlPQI8LGAAd9i2AHAVIM5qtbY9Fu3qLVjxVDYxf3oehLq?=
 =?us-ascii?Q?n65IbT09qF/2yigyBSe0VoY4QR4Hf4dY6RGtL4O2HgmmHIBbNKcERfwcyl3y?=
 =?us-ascii?Q?lUJzQH+CtrT1j5dxfRObD5Tzjo1i71mmWNMVDrhLPoL6aYdIwhTx6psmScce?=
 =?us-ascii?Q?WzGXN9/F92dS0TFrV7zPVKK7jJc54yNDbOpXavIB7W6NHbq2w6GtsZD6kmKy?=
 =?us-ascii?Q?xuegjkL+rxJJJ20y0Datb4aBijlThzlID4ITO+af/ljYItk//kJiauxgBWvi?=
 =?us-ascii?Q?dtq5Sh+VEjhfAW5Z3b2c5uNe8QQEzAo3uDguwzpoDwA1v8tAveofFghi4+Ni?=
 =?us-ascii?Q?FobgoVMy0us5sYTJ7JV3cjZ4yMbUu5kDAPko6cCkk9vc2DkpqVmA3QRKNwY7?=
 =?us-ascii?Q?QYDhPOFGCyim0CtvQnygq21VqsqhAYu1OfNa39uw1Z898C2LoZ+fHEkSDrJZ?=
 =?us-ascii?Q?v2i1NtgDNTKekM7IGMprMLwiQ2aJS/BNlAUqVXcZdGFiyitwlOA+wNt9E5la?=
 =?us-ascii?Q?lKp9f+gTuT40rs+c0V4lBDiHU7FeQ3wscmPTFBUCLnxrleCiSdncb9LgTJcq?=
 =?us-ascii?Q?a7xSquLccP2gUfsUVB5vHcqn8LebKqGHIrIUQB/82MMTBwAoWn6WDq/fuTr8?=
 =?us-ascii?Q?J53g3QcPtgHWhFjDcfuiom1cGGACkUwJm+KFye7VLITFJrxPjSpxtFLGVc6t?=
 =?us-ascii?Q?hs8OZ799ZE8/wWg+KIM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40242d9-5fb4-44d6-42b6-08db877c37fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 10:46:18.7897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Pvp2VCnL2zEyWZ/2Fz6gHmbEXUn8+8s5d7+JGMkM1lSAnCb0XhUmueL6K1/sk4q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6590
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "jingyuwang_vip@163.com" <jingyuwang_vip@163.com>,
 "bellosilicio@gmail.com" <bellosilicio@gmail.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "trix@redhat.com" <trix@redhat.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "lenb@kernel.org" <lenb@kernel.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Personally I would like to treat the wbrf core as a water pool. Any stream =
can flow in. Also any needed can drain water from it at any time.
The way to allow producers to report only when there is consumer existing d=
oes not work. Since the consumer might come after the producer.
Just considering the scenario below:
Wifi core/driver started --> wifi driver reports its frequency in-use  --> =
proper action taken by wbrf core --> amdgpu driver(consumer) started
What should be the proper action taken by wbrf core then? Stop the producer=
 to report its frequency in-use? That might lead consumer to never have a c=
hance to know that.

The wbrf_supported_producer and wbrf_supported_consumer APIs seem unnecessa=
ry for the generic implementation.
But to support AMD ACPI implementation(or future device tree implementation=
), they are needed. The wbrf core needs to check whether the necessary AML =
codes are there.
It needs those information to judge whether a producer can report(will be a=
ccepted) or a consumer can retrieve needed information.

> > +struct wbrf_ranges_out {
> > +   u32                     num_of_ranges;
> > +   struct exclusion_range  band_list[MAX_NUM_OF_WBRF_RANGES];
> > +} __packed;
>
> Seems odd using packed here. It is the only structure which is
> packed. I would also move the u32 after the struct so it is naturally
> aligned on 64 bit systems.
This is to align with the AMD ACPI implementation.
But I can make this AMD ACPI specific and bring a more generic version here=
.

Evan
> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Thursday, July 13, 2023 7:12 AM
> To: Quan, Evan <Evan.Quan@amd.com>
> Cc: rafael@kernel.org; lenb@kernel.org; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> airlied@gmail.com; daniel@ffwll.ch; johannes@sipsolutions.net;
> davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> pabeni@redhat.com; Limonciello, Mario <Mario.Limonciello@amd.com>;
> mdaenzer@redhat.com; maarten.lankhorst@linux.intel.com;
> tzimmermann@suse.de; hdegoede@redhat.com; jingyuwang_vip@163.com;
> Lazar, Lijo <Lijo.Lazar@amd.com>; jim.cromie@gmail.com;
> bellosilicio@gmail.com; andrealmeid@igalia.com; trix@redhat.com;
> jsg@jsg.id.au; arnd@arndb.de; linux-kernel@vger.kernel.org; linux-
> acpi@vger.kernel.org; amd-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; linux-wireless@vger.kernel.org;
> netdev@vger.kernel.org
> Subject: Re: [PATCH V6 1/9] drivers core: Add support for Wifi band RF
> mitigations
>
> > +/**
> > + * wbrf_supported_producer - Determine if the device can report
> frequencies
> > + *
> > + * @dev: device pointer
> > + *
> > + * WBRF is used to mitigate devices that cause harmonic interference.
> > + * This function will determine if this device needs to report such
> frequencies.
>
> How is the WBRF core supposed to answer this question? That it knows
> there is at least one device which has registered with WBRF saying it
> can change its behaviour to avoid causing interference?
>
> Rather than "Determine if the device can report frequencies" should it be
> "Determine if the device should report frequencies"
>
> A WiFi device can always report frequencies, since it knows what
> frequency is it currently using. However, it is pointless making such
> reports if there is no device which can actually make use of the
> information.
>
> > +bool wbrf_supported_producer(struct device *dev)
> > +{
> > +   return true;
> > +}
>
> I found the default implementation of true being odd. It makes me
> wounder, what is the point of this call. I would expect this to see if
> a linked list is empty or not.
>
> > +/**
> > + * wbrf_supported_consumer - Determine if the device can react to
> frequencies
>
> This again seems odd. A device should know if it can react to
> frequencies or not. WBRF core should not need to tell it. What makes
> more sense to me is that this call is about a device telling the WBRF
> core it is able to react to frequencies. The WBRF core then can give a
> good answer to wbrf_supported_producer(), yes, i know of some other
> device who might be able to do something to avoid causing interference
> to you, so please do tell me about frequencies you want to use.
>
> What is missing here in this API is policy information. The WBRF core
> knows it has zero or more devices which can report what frequencies
> they are using, and it has zero or more devices which maybe can do
> something. But then you need policy to say this particular board needs
> any registered devices to actually do something because of poor
> shielding. Should this policy be as simple as a bool, or should it
> actually say the board has shielding issues for a list of frequencies?
> I think the answer to what will depend on the cost of taking action
> when no action is actually required.
>
> > + * wbrf_register_notifier - Register for notifications of frequency ch=
anges
> > + *
> > + * @nb: driver notifier block
> > + *
> > + * WBRF is used to mitigate devices that cause harmonic interference.
> > + * This function will allow consumers to register for frequency notifi=
cations.
> > + */
> > +int wbrf_register_notifier(struct notifier_block *nb)
> > +{
> > +   return blocking_notifier_chain_register(&wbrf_chain_head, nb);
> > +}
>
> What are the timing requirements for the handler? Should the handler
> block until the device has finished doing what it needs to do and the
> frequency response has settled? We don't want the WiFi device doing a
> SNR measurement until we know local noise is at a minimum. I think it
> would be good to document things like this here.
>
> > +struct wbrf_ranges_out {
> > +   u32                     num_of_ranges;
> > +   struct exclusion_range  band_list[MAX_NUM_OF_WBRF_RANGES];
> > +} __packed;
>
> Seems odd using packed here. It is the only structure which is
> packed. I would also move the u32 after the struct so it is naturally
> aligned on 64 bit systems.
>
>       Andrew
