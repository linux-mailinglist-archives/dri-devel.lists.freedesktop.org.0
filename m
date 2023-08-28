Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A178078A47F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 04:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A219F10E071;
	Mon, 28 Aug 2023 02:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5BE10E05A;
 Mon, 28 Aug 2023 02:11:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CX9R1kxdUj+y52cUQTFACZQW2a8MqOXqK0LNtAhEoTrR3OmFANv0wKhQiWdveSW810QrzennddnwxpXUpxHBYoLtGHBXYh+ZdsuIaWuZSpv/Nyb0sdl3GT3NVkJmo6ITcDe5ngdC8gcFrqYzgrwZXxn7mj75z4WTa1xl0iSDP+JlytNlEmCrqBSsFm+YWQuJHol5wE8j9gkbAb2Eyye4Z3NtT2c7cJ7FyHS+Pz2060qBmOAes5F6bK6LKtInm3RKSTNLzru84fc4hxh+T/lDl531g90dw5M00z6ElS/fiB7Pyfnx6lZpL6P6+eXacQOY2zCN9QA27tzWzmDLk/9+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gX3y5OrJiX/FX8YjMnFUOuqfTjqAPks9TA4vK2pp7MY=;
 b=hgcZJJtSCrmisz4dTsANq6n9F1w1JpcoycOwf9J4h6HJ0L01A0UvCT832p22qV2FgSzkedzRrXjGAVjdtpjxUCOh8zNsrSFLkLS3OZl8pFrt9HpnxXf80dP9rXmIaslPV7H8F3Cr6LxybQJcRZVDhxuIokUfU3ZHVH1wo2MNP3RP9Uv9je8NbXEd8343335T0YZ3GHYiM8u3eKCfX4C3TDqCug/nW6deEMD0vUfp96V6Q3lBC4jWf0uD+132zxx2xeP4752dkEVb/N6Fvzg2NZUOSApiZ2cjOLRxrSePvr1PesHQLSe8rMtqym6KHsD7fNoejsoI+WsEhvVNH9Mb6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX3y5OrJiX/FX8YjMnFUOuqfTjqAPks9TA4vK2pp7MY=;
 b=JCiElC4GNf4KMa4G3DNe7jtGNXHVlJ44dd/88uwABpyKPvcAxjTsVrzH/OyKjjFKSwz4GIf0LX7kTX7fwefstIbTKkm/SLk5Q5Jhxf3hfyHqza0J3c266h/25yavHqzTRyVM5ZIHmspwAMrLgAy2oh7r5jCuWhR1UoRGL7uFHqA=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 SA1PR12MB7199.namprd12.prod.outlook.com (2603:10b6:806:2bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Mon, 28 Aug
 2023 02:11:28 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::56a5:d451:bf62:2b06]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::56a5:d451:bf62:2b06%7]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 02:11:28 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Simon Horman <horms@kernel.org>
Subject: RE: [V10 1/8] ACPI: Add support for AMD ACPI based Wifi band RFI
 mitigation feature
Thread-Topic: [V10 1/8] ACPI: Add support for AMD ACPI based Wifi band RFI
 mitigation feature
Thread-Index: AQHZ1y/QeOXojhql1U2XgrjLS9EoQa/+S/8AgACvUpA=
Date: Mon, 28 Aug 2023 02:11:27 +0000
Message-ID: <DM6PR12MB2619013F8683DFBBADC68502E4E0A@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230825083846.4001973-1-evan.quan@amd.com>
 <20230825083846.4001973-2-evan.quan@amd.com>
 <20230827154312.GT3523530@kernel.org>
In-Reply-To: <20230827154312.GT3523530@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=f0bf4386-1b7f-4740-98a7-61ea3ff406eb;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-28T02:10:42Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|SA1PR12MB7199:EE_
x-ms-office365-filtering-correlation-id: f223e4e2-019f-4610-ae61-08dba76c1697
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XsdTRD2MV74vUAn0Lwz6Srt8DthvQSXiskNue7wbY9/1MuHJW8cULeEqzqeBIJO3facRC/VDzs0Kua22dJcKwbpSMHH2cw7U6F6TXambVtg2qgKV3c0vgl8x4nOCxa48z+nqgj8RAdqwX0W53nsl61sdzGy2P0V/JKMW9b4PTcFE+mqYJtcM4k7mO6WZRw95+4dhxXcTkKHN0X/qg+lnWDN82zgZWFj/1A5Lv6SldakWK8VaTkVlpEXsRQO+cdkr/jFv0623J6y9eyujwzw/LdB8LXXfEXTvf1Ba6IcP/gv51swp/AROVOH287412EA0+y4Djz14bLpWGCFBuduTG1/tLrzftBe1OsmIRo04IkBRgRUFTLKC7NbzLDXC1tInK/4QEWRzw906ASzQx/l9yYEJDD/dbwQpWl87UAKlcBdLdXZP3A5Be962NdFhBEbd8tJKRjp/I4t8R4B5sMwxNcTWY7RHGcOAPbEmEQthFitKnu06s28L6y/PuKWNZAtOw6fxo+uc/p02oxXgIyab3RVauQjlJLh3TKfWFsgy8F4btyv01LuZETR2yEK/bY4u7wJJAY6TZBdq9uLFueyaB26fDPyN412z9g+71GBecJY56mLKH4CsPOIEUn9li2AP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(376002)(39860400002)(136003)(1800799009)(186009)(451199024)(7416002)(83380400001)(55016003)(9686003)(478600001)(26005)(5660300002)(2906002)(52536014)(8676002)(4326008)(8936002)(122000001)(38100700002)(38070700005)(64756008)(6916009)(66946007)(66556008)(76116006)(86362001)(71200400001)(41300700001)(53546011)(7696005)(54906003)(316002)(66446008)(33656002)(6506007)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p3g7/WfUJyAdpkxoi4IOESjTqFBZ8vasW5wsyXOY++hAtsA7yGxhYUtsp9XZ?=
 =?us-ascii?Q?TmA9m44S4zQPQ7ai5FZCL/wQYStPWh3Ovft9390s8+ilaG2hwwWtEzR1OU3R?=
 =?us-ascii?Q?pqwtpDjc8HU631jEVz9GRBUMfCGAlhkuwjTfJ5L8IA6yJoPXAZgs6YwtfuUW?=
 =?us-ascii?Q?H9KUhwT9VOSewdQAjR6fY9MDgA31vlBpVu/Dd1sctMa4WXvqY8IqZjTT4LEf?=
 =?us-ascii?Q?XsFNZZbEexhR2vkes71dz4hnoImYS3B/hicGwB0NMDvB+jAQewLoIM71m2jm?=
 =?us-ascii?Q?RnBfzvMR913WuwGIvdD5zKDHy75QVaufF3n/JteOKV1wtJp1oHWL7P0QE6lV?=
 =?us-ascii?Q?E7+3XTHszEYYn6vIf6OmVAI/cJvxT+lfaQnT/ABL+34aIVvCwlXW3ud/BTkU?=
 =?us-ascii?Q?V+TOWWMhv0xEXvenA48YqRzvzpfsJEplHXiTJWznHC1V5TVNdFrIDIsQ0D6q?=
 =?us-ascii?Q?QvUnaJqOdV4ZpcO0Pu56uhPOCq6J3Zc5+CJ9a3YVxPiYlOwtkBWG68RvpTgm?=
 =?us-ascii?Q?OZvmapdTb96JpXSRinoCBSFClWfQbXvyF9kHYhpx9156dDYj/wm7GY+Rg0za?=
 =?us-ascii?Q?O+ULwAAzwgMRAGxJuQCOZqMAmIzOsx3RytC6waHHtI64c7ljZmZ9HsYDHBu8?=
 =?us-ascii?Q?egIa6zWoYwo3ZYNohddp71dF1LcRuMwhAyKqMllqcITxSDxg/czzFJrM3ATP?=
 =?us-ascii?Q?vCY9yGdYntHroJZD0qTUksvsB2UqmnUyoyEC5ufZX/SUfkhDHOUdJovZvS7v?=
 =?us-ascii?Q?3YNy3n7CQhh3g0PlqPNiNf1cpX707/UpM8oHIo/oyibGJB91KvFWD0D56Nzt?=
 =?us-ascii?Q?BeDj5DbIXOqFormJ8+Na8AhGwK1/kCtfBSf4qhJzKNe641kOR6qBE2JoSbrR?=
 =?us-ascii?Q?vwlWuFS6ZTCG4arbMkQkSlzoF+vILyLjPXCo/mzBp2Lrf9ExmZP3YL15zu8T?=
 =?us-ascii?Q?aj8JsdiK0HPRQazZl+SKd21U09e6T/VaFghDEcO6m13m8eCgpEXhLPSDHqYg?=
 =?us-ascii?Q?s2NPwJeE6EEZnHywHN51Hm0iUa2euOKQdupDUq6frIPXZNBKL3hLutJl/moS?=
 =?us-ascii?Q?vG7PvaPxysCZV4Dq3LjsTCWGxcoYekPwnwz+PTT4mFUBkPyiUbiDh9WP5XIa?=
 =?us-ascii?Q?q5fl5ISw+j+INpTqaPBKAk4y9FejNqLTi07oIZnQzHobgRtM37+63Lf/FtSh?=
 =?us-ascii?Q?lg3zSEJOGAusyCPIVa5S9u8ZM3Q5OOkCwxtDsA2ISObdif4awTRuQ4Db45oh?=
 =?us-ascii?Q?pGmSRvXFwqmgijnQEUKmKJ47MwiRdZJMVuT2uwyL4DlIuSJBqHmYfXscd1Fj?=
 =?us-ascii?Q?+/8aXZWgaWxHXQhQWLR3V4jE3JOWkrkTeejfBF4nAWHvBrKN4e7KgTxmPDG5?=
 =?us-ascii?Q?l8p4ZN+0sk1nJ0v5Q3wycChi9kUde+cAKiFvPU4UpJ648nb4S3yGoK+uOtBc?=
 =?us-ascii?Q?MQgWes2gSiwtriphWC3NPJnhPWQVtFHf7jv4ieNVkkgTeyWD5PpPzxMIYN83?=
 =?us-ascii?Q?AUajgl3dk/9jFiObKSRzqzAtd/1b9wdjbr5nZdPlSj4hVWI05kFWOA1EMAGe?=
 =?us-ascii?Q?cUVUC4nDL89P5k7fJnY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f223e4e2-019f-4610-ae61-08dba76c1697
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 02:11:27.9947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uPa9os8XPcWkTITB0HIdmqIsQHa4FQtnZF+h1hFZ3g+DJsPqwmAKnIDWU0jZPWPz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7199
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
Cc: "rafael@kernel.org" <rafael@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "lenb@kernel.org" <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

> -----Original Message-----
> From: Simon Horman <horms@kernel.org>
> Sent: Sunday, August 27, 2023 11:43 PM
> To: Quan, Evan <Evan.Quan@amd.com>
> Cc: lenb@kernel.org; johannes@sipsolutions.net; davem@davemloft.net;
> edumazet@google.com; kuba@kernel.org; pabeni@redhat.com; Deucher,
> Alexander <Alexander.Deucher@amd.com>; rafael@kernel.org; Lazar, Lijo
> <Lijo.Lazar@amd.com>; Limonciello, Mario <Mario.Limonciello@amd.com>;
> linux-kernel@vger.kernel.org; linux-acpi@vger.kernel.org; amd-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> wireless@vger.kernel.org; netdev@vger.kernel.org
> Subject: Re: [V10 1/8] ACPI: Add support for AMD ACPI based Wifi band RFI
> mitigation feature
>
> On Fri, Aug 25, 2023 at 04:38:39PM +0800, Evan Quan wrote:
> > Due to electrical and mechanical constraints in certain platform
> > designs there may be likely interference of relatively high-powered
> > harmonics of the (G-)DDR memory clocks with local radio module
> > frequency bands used by Wifi 6/6e/7.
> >
> > To mitigate this, AMD has introduced a mechanism that devices can use
> > to notify active use of particular frequencies so that other devices
> > can make relative internal adjustments as necessary to avoid this reson=
ance.
> >
> > Signed-off-by: Evan Quan <evan.quan@amd.com>
>
> ...
>
> > diff --git a/drivers/acpi/amd_wbrf.c b/drivers/acpi/amd_wbrf.c
>
> ...
>
> > +/**
> > + * acpi_amd_wbrf_add_exclusion - broadcast the frequency band the
> device
> > + *                               is using
> > + *
> > + * @dev: device pointer
> > + * @in: input structure containing the frequency band the device is
> > +using
> > + *
> > + * Broadcast to other consumers the frequency band the device starts
> > + * to use. Underneath the surface the information is cached into an
> > + * internal buffer first. Then a notification is sent to all those
> > + * registered consumers. So then they can retrieve that buffer to
> > + * know the latest active frequency bands. The benifit with such
> > +design
>
> nit: ./checkpatch.pl --codespell suggests benifit -> benefit.
Thanks, will fix that.

Evan
>
> > + * is for those consumers which have not been registered yet, they
> > +can
> > + * still have a chance to retrieve such information later.
> > + */
> > +int acpi_amd_wbrf_add_exclusion(struct device *dev,
> > +                           struct wbrf_ranges_in_out *in)
> > +{
> > +   struct acpi_device *adev =3D ACPI_COMPANION(dev);
> > +   int ret;
> > +
> > +   if (!adev)
> > +           return -ENODEV;
> > +
> > +   ret =3D wbrf_record(adev, WBRF_RECORD_ADD, in);
> > +   if (ret)
> > +           return ret;
> > +
> > +   blocking_notifier_call_chain(&wbrf_chain_head,
> > +                                WBRF_CHANGED,
> > +                                NULL);
> > +
> > +   return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(acpi_amd_wbrf_add_exclusion);
>
> ...
