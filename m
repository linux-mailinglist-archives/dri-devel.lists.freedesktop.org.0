Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C34079F8E1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 05:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA4710E113;
	Thu, 14 Sep 2023 03:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAA710E0DB;
 Thu, 14 Sep 2023 03:29:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdaEDTkjT1iFI9K5+mFqqC2BquKnibjfndjkuw8LZQ5JUAoHLpmPl3dkUxtYbD3v0Vg2Gp737vzSOmoLwGsM4IGREv85jzdJThKSj+xV5XZDYohL5bcAXUbK+G92TipP7Wn1Ce+sVV9aeTYO45fM7rzNGURIVwYs22PN2gYUiXTm2mX8XPFo2kHCpPqoeSfmXqYRODxPnEbnoeWCTBj2aiRF6JIwJ5wXptIkKFNo6Q5KNY1qtnD+8jVqThYlYXaVaVu485BdM+ubT4rGcy/bp+5hWvoG+YXqp6xfNxgcVAo8Xhjro4uz3H0w8xdwpaNdFXC7yCQpirn8G171G66Z8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuwdqZHihVOqCqREcSmFM+qCuFX4CmtblVqyYA2PtBY=;
 b=i58k+2/DrG4liGck9m7S3Fqc4jnzxjZa2Ou0cnByBCrbEkwK0STvNKgMSwYFXr5paf2GtHQtYNc8CAflk0aQ8VN/ymIcdXbfpN3FksGOgvmkNpWhlYkZoMaWilun9wUNbvRPAaYBBPch73SlUqu+gCH8z7Igc8D4L0KXyOzWbHTu9+T+Gdh/SRg6yFbG+V2s7BI3X5GP8LlM4GbzA3HigeeLVzoUBl7C5r5ZpKufMOOksAVvHyYk3VR3ITUM45WQU7ftQ3B2MyTTosIuQFn4nW0e0xKykStghDJfLdlSZEJ1pOAxk45/MMbZ9pjipGKpJ9CSrLWjOjXkMNwr3V/T5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuwdqZHihVOqCqREcSmFM+qCuFX4CmtblVqyYA2PtBY=;
 b=w8HTAvYdcdMjI9yZACEmn2KefgxjEW52BcjgpbiAcDj0hZl9YjsaitqdIVQmsI+mpKpSNiaSdoVWPK/KHbv51qrdjOBw3qhwp1We7BBG3nF0micf0gO2Ud2p+uws2C9lAJUHHYLKSBwve9IhhoH+hK/B7YyiPmNTGN4noOp5z/Y=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by PH7PR12MB6693.namprd12.prod.outlook.com (2603:10b6:510:1b0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 14 Sep
 2023 03:29:22 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::fd43:1117:583:d37a]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::fd43:1117:583:d37a%3]) with mapi id 15.20.6768.036; Thu, 14 Sep 2023
 03:29:22 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "imre.deak@intel.com" <imre.deak@intel.com>
Subject: RE: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Thread-Topic: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Thread-Index: AQHZxpvrGNhE4HkDQUKz6BD10YkZXK/aRFEAgAPTpQCAAOsxAIAAqq0AgBC8pwCABt6JcIAD4XUAgBO5wdCAAqENgIAFbmkwgABU2wCAApZogA==
Date: Thu, 14 Sep 2023 03:29:21 +0000
Message-ID: <CO6PR12MB548970794262ADA111DE7901FCF7A@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <ZM0Z3sZEYMcMTnuP@ideak-desk.fi.intel.com>
 <CO6PR12MB5489306FA44F5F107180E57DFC0CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZNEU8j6OR3KirIcS@ideak-desk.fi.intel.com>
 <CO6PR12MB548978FEE8BE8300F43D4486FC0DA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZN+uWC1fDKZUmDdL@ideak-desk.fi.intel.com>
 <CO6PR12MB5489E92E7A29CA7285602B20FC1CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZOiywboCeFxJwCCP@ideak-desk.fi.intel.com>
 <CO6PR12MB5489FC7230B9D400EEF5735CFCEEA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZPtzhcxqWPB07vfw@ideak-desk.fi.intel.com>
 <CO6PR12MB5489BBC86F6113C5019F3D96FCF1A@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZQBJEKg8oHq8sSyN@ideak-desk.fi.intel.com>
In-Reply-To: <ZQBJEKg8oHq8sSyN@ideak-desk.fi.intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=9181c79f-4684-4708-81a9-5544c0fc4540;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-09-14T02:49:37Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|PH7PR12MB6693:EE_
x-ms-office365-filtering-correlation-id: 1789f357-24bb-473a-6f71-08dbb4d2c978
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NqHL8Wj5jj9/t1+BXKCVm6oQrB95RkIvKbHlnVPH10RSNtzQPGHDC2VERSU780jyFS3yK2Ej8quoTs+Cf4sHm2ly58bojUkP3D9nOVlW+idFPm4ZDn0Srk3wqjjEws3tBLSYwbhlQPcudszGBiGURwAGKcT/EV7e6cgaRD4vq7TbrzpH6g2IMSRHEYO/jjhRmPtBNLdcMewm9XYXrQjZPLqJc0i7f+MtE+WxSFt3+aQ9aOA7z8wLSNVhlaTGqP3DRIQ3aj9KZCzaF0rSG2WrGM+zTKnzMo9LZz9JZtx/cI4i9iJUZ4IxQhRY7A3Ivu7jE+wCWAaeiUOSJK49K/TGoqesaWftHiAUliIe5qMVJLNKvGyjkv1OMlK7dk0b8RVPR5MNbxjqtG7wYw1812UEesSUdZ7dSB0mAea+Zj1dXUjs5wj0lZ4OUwkzg+kpoFukqolLeis41cVQ4hl+MV5l0Vfq037EQxQnMOQyfTGWxrCapPQzV3dK9BW5nqOqdLcZjtQAJcqvTsLHMiTFK3t+9xXbx4/TZAcGGaJMi3DckHuWH9iwQK/4++UQ6XVRd8e9/TcfdgUw0fXfTF8sMEfVeNiEQ6lE1FuHEv7vShRz2R6q+jijUUOV96jZO9Q5FbPZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199024)(186009)(1800799009)(26005)(55016003)(83380400001)(66899024)(8936002)(38100700002)(38070700005)(2906002)(33656002)(71200400001)(122000001)(86362001)(478600001)(41300700001)(52536014)(8676002)(30864003)(5660300002)(4326008)(316002)(66946007)(66476007)(64756008)(6916009)(54906003)(66556008)(66446008)(9686003)(76116006)(53546011)(55236004)(6506007)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ezZpP5bK9ctDUZzBOmxkJ7NoBnIdgsj8zIocGyDBA2Oudg2Wgl2qAfy8pbhX?=
 =?us-ascii?Q?LUAqIp+dzCHuAs1ut5lm+dMbTXo0VfBP+9UznUZPNpPZqa0weZT1lieJc+Nk?=
 =?us-ascii?Q?fYu8NZLnILj4c9nlgY4lvHqLxMZ4Pt6frlvpAjJD1II1U0nBiLgPh8tk1VIy?=
 =?us-ascii?Q?OZGvWORjFXjdVzO1F9Bvli490i0zMJbCJrlUAWEdUNO1qShhOHp+uGvr1kWB?=
 =?us-ascii?Q?ZucxGKX4bN2T67UbhAntaP53qIWaFPxqO7InYkTBpKYzTaWgwWyT7GeCqUrb?=
 =?us-ascii?Q?m+AlQyKwCyVPq5xRgP1RvqHG6S86eYgJtf8Mq0xcuNXpJUDIXQWnFr+8LDWI?=
 =?us-ascii?Q?+PmrhHeOo+kYmj/vCk9ka/ulBoiLXyecpSwS9zZhRb3HyayHtCrz5aB2EJ4F?=
 =?us-ascii?Q?1F+/N/T3w21MIirxayey/Cj22OyiBKEqlVaiOl94qKa4hcYRnQ8WALt7B94T?=
 =?us-ascii?Q?V54y66FNWhCS2hT9JvSQjGqXbR0DbltbAgqAtSxLy9IVONcs7FHK5IxoIXMZ?=
 =?us-ascii?Q?vce4IrXEswLqRF/TaP6e/t3sthQOeFIFXyLgiT090eWyOuasgef+d1X8hvoO?=
 =?us-ascii?Q?HoC0zcr6lXWfil25dHeoH488QHl72ScgMdJ7a9R85xtX+oIXU6hwp8KsQ8Ss?=
 =?us-ascii?Q?t1I0xhfUkl9Zk+Lj6SaYI1wb1fjjd8QMKHbDmPtknAVWOTZo5pezCkiKflB8?=
 =?us-ascii?Q?uI69XkLIkpwmUKnfgoVaAcBh7JZgH4/VJWljgXh8ESK5Tl1PDVIxYawiWP8K?=
 =?us-ascii?Q?fbmpRb2w0POOCq5Caqm7UiVHj+DN0lyThE5/u7lhQwfF2f86ukCvGB+B67Lu?=
 =?us-ascii?Q?ag2cqxox35pNBPUVgW2mWTIIkq3JqLgE7ZVdJ3ZlIGJCl+l8aMQck52tXv6C?=
 =?us-ascii?Q?xWfgLdpielnz423PJ7j8WwAX5lhTVyj40CKhwd2OCrz3B5kWngJ74LEL9Aca?=
 =?us-ascii?Q?9sr9Vi2P/foH9YEJcpTy3WUFaOlXzE2WL+Wb03g8PnssVOBHRVqAm3Hplgnb?=
 =?us-ascii?Q?PToORia118keEiFNbrFmIGxsWFiqE0T5suHW9ql1mskez+UNO93Uu9IbhfzW?=
 =?us-ascii?Q?W4cxzn2cVFcwstoX6tfW6f6QRsZ0k/8QMMol4uVe94X8xyhN+orndPDS3sra?=
 =?us-ascii?Q?0My24fO9X+DJvxI3fwbOS/0E2fV+JfE+jfjaeSLaxbAcWhFXnkajnOVBkCWp?=
 =?us-ascii?Q?LYsV4H9Hqx60L6LlK5Cor/BbWwAFZf/BO/7uj85lRO3yzCx9euI9ndZgDIHZ?=
 =?us-ascii?Q?1TGkW7gzNZ8zZ49XwSYOrLijvw+GeuGQzxH5PBSfVdWh/4ye5dMWayKAXGGm?=
 =?us-ascii?Q?ndLHeRlj7XQ50FxIWL++vrTA3/OLUQIpfUpJojoZNmcI1hCghsn5B3n6XWbc?=
 =?us-ascii?Q?+Gxjpy9/nM3dXZVF021heBZyts7cqG7ou2fNukAAii78dtTYjQYofhk3tZXC?=
 =?us-ascii?Q?+bUiXIUK3Ju4aXyUS1oez5ujlS8WjpX928RSqov1txPPM95wadHyQ0dl/lAs?=
 =?us-ascii?Q?KIU90m2Z4iNvZpzUfm/qQ2grSMvzLeCLFVyW4QtrZSBIcbYPTmPD43B7ddvV?=
 =?us-ascii?Q?wpQ3nrvMc24qmzUaldM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1789f357-24bb-473a-6f71-08dbb4d2c978
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 03:29:21.8812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Di/1+aYxacDUOtGpwFm+KYw0CasiOoECcqpvqCbeugf4gpj2D1RlIdrfgjhn3rz3Irc8mQ+2AFTIlL5axvMOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6693
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
Cc: "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: Imre Deak <imre.deak@intel.com>
> Sent: Tuesday, September 12, 2023 7:19 PM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> lyude@redhat.com; jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> <Jerry.Zuo@amd.com>
> Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> drm_dp_remove_payload_part2()
>
> On Tue, Sep 12, 2023 at 07:26:29AM +0000, Lin, Wayne wrote:
> > [Public]
> > [...]
> > >
> > > I'd like to be sure that the payload is removed with the size it was
> > > added with in the previous commit and as I wrote above not depend
> > > for this on the new payload state with a mixture of old/current/new s=
tates.
> > > Based on that I'd be ok for instance with a new
> > >
> > > int drm_dp_remove_port_payload(mgr, mst_state, port)
> > >
> > > function which looks up / removes the payload with the time_slots
> > > calculated based on the payload table as in your patch and returns
> > > the calculated time_slots.
> > >
> > > The AMD driver could call the above function and the current
> > > drm_dp_remove_payload(mgr, mst_state, old_payload) function would be
> > >
> > >       time_slots =3D drm_dp_remove_port_payload(mgr, mst_state,
> > > old_payload->port);
> > >       WARN_ON(time_slots !=3D old_payload->time_slots);
> > >
> > > --Imre
> >
> > Sorry but I might not fully understand what you suggested here. Would
> > like to know if you agree on referring to the time slot number of the
> > payload table at the moment is better then referring
> > old_payload->time_slots for drm_dp_remove_payload()? If you agree on
> > that, my patch actually is just replacing old_payload->time_slots with
> > the more appropriate one. Not adding mixture of old/current but replaci=
ng
> the old with the current one.
>
> The new_payload state contains a mixture of old/current/new state at the
> moment and this patch adds more dependency on that, recalculating the old
> payload size from that state. For i915 this recalculation isn't needed, t=
he size is
> already available in the old payload state.
>

I see. Thanks, Imre. So it's about the idea to have another patch to extrac=
t things
like vc_start_slot out of mst state.

> > And like what I explained in previous example, when calling
> > drm_dp_remove_payload(), the time slot number to be removed shouldn't
> > be constrained to the one in previous commit. The number in the
> > payload table when we're about to remove the payload might be a better
> > choice. Could you elaborate more what's the mixture that this patch is
> adding on, please?
> >
> > As for the changing suggestion, are you suggesting to create a new
> > function
> > drm_dp_remove_port_payload() to wrap up the calculation in my patch?
> > If so, I think that's the consensus to use current time slot number to =
replace
> the one in old_payload.
> > Therefore, it doesn't have to pass old_payload to
> > drm_dp_remove_port_payload(), and "WARN_ON(time_slots !=3D
> > old_payload->time_slots);" is not appropriate as for the example that I=
 gave
> previously.
>
> I meant something like the following:

The change looks good to me. I'll update the patch. Thanks for the help.

>
> diff --git
> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index cbef4ff28cd8a..0555433d8050b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -343,7 +343,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>       struct amdgpu_dm_connector *aconnector;
>       struct drm_dp_mst_topology_state *mst_state;
>       struct drm_dp_mst_topology_mgr *mst_mgr;
> -     struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
> +     struct drm_dp_mst_atomic_payload *new_payload;
>       enum mst_progress_status set_flag =3D
> MST_ALLOCATE_NEW_PAYLOAD;
>       enum mst_progress_status clr_flag =3D
> MST_CLEAR_ALLOCATED_PAYLOAD;
>       int ret =3D 0;
> @@ -366,9 +366,8 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>       if (enable) {
>               ret =3D drm_dp_add_payload_part2(mst_mgr, mst_state-
> >base.state, new_payload);
>       } else {
> -             dm_helpers_construct_old_payload(stream->link, mst_state-
> >pbn_div,
> -                                              new_payload, old_payload);
> -             drm_dp_remove_payload_part2(mst_mgr, mst_state,
> old_payload, new_payload);
> +             drm_dp_remove_current_payload_part2(mst_mgr,
> mst_state->base.state,
> +                                                 aconnector-
> >mst_output_port);
>       }
>
>       if (ret) {
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index e04f87ff755ac..4d25dba789e91 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3382,37 +3382,70 @@
> EXPORT_SYMBOL(drm_dp_remove_payload_part1);
>   * drm_dp_remove_payload_part2() - Remove an MST payload locally
>   * @mgr: Manager to use.
>   * @mst_state: The MST atomic state
> - * @old_payload: The payload with its old state
> - * @new_payload: The payload with its latest state
> + * @port: MST port
>   *
>   * Updates the starting time slots of all other payloads which would hav=
e been
> shifted towards
>   * the start of the payload ID table as a result of removing a payload. =
Driver
> should call this
>   * function whenever it removes a payload in its HW. It's independent to=
 the
> result of payload
>   * allocation/deallocation at branch devices along the virtual channel.
>   */
> -void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr
> *mgr,
> -                              struct drm_dp_mst_topology_state
> *mst_state,
> -                              const struct drm_dp_mst_atomic_payload
> *old_payload,
> -                              struct drm_dp_mst_atomic_payload
> *new_payload)
> +int drm_dp_remove_current_payload_part2(struct
> drm_dp_mst_topology_mgr *mgr,
> +                                     struct drm_atomic_state *state,
> +                                     struct drm_dp_mst_port *port)
>  {
>       struct drm_dp_mst_atomic_payload *pos;
> +     struct drm_dp_mst_topology_state *mst_state =3D
> +             drm_atomic_get_new_mst_topology_state(state, mgr);
> +     struct drm_dp_mst_atomic_payload *new_payload =3D
> +             drm_atomic_get_mst_payload_state(mst_state, port);
> +     int time_slots_to_remove;
> +     u8 next_payload_vc_start =3D mgr->next_start_slot;
> +
> +     /* Find the current allocated time slot number of the payload */
> +     list_for_each_entry(pos, &mst_state->payloads, next) {
> +             if (pos !=3D new_payload &&
> +                 pos->vc_start_slot > new_payload->vc_start_slot &&
> +                 pos->vc_start_slot < next_payload_vc_start)
> +                     next_payload_vc_start =3D pos->vc_start_slot;
> +     }
> +
> +     time_slots_to_remove =3D next_payload_vc_start -
> +new_payload->vc_start_slot;
>
>       /* Remove local payload allocation */
>       list_for_each_entry(pos, &mst_state->payloads, next) {
>               if (pos !=3D new_payload && pos->vc_start_slot > new_payloa=
d-
> >vc_start_slot)
> -                     pos->vc_start_slot -=3D old_payload->time_slots;
> +                     pos->vc_start_slot -=3D time_slots_to_remove;
>       }
>       new_payload->vc_start_slot =3D -1;
>
>       mgr->payload_count--;
> -     mgr->next_start_slot -=3D old_payload->time_slots;
> +     mgr->next_start_slot -=3D time_slots_to_remove;
>
>       if (new_payload->delete)
>               drm_dp_mst_put_port_malloc(new_payload->port);
>
>       new_payload->payload_allocation_status =3D
> DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> +
> +     return time_slots_to_remove;
> +}
> +EXPORT_SYMBOL(drm_dp_remove_current_payload_part2);
> +
> +void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr
> *mgr,
> +                              struct drm_atomic_state *state,
> +                              struct drm_dp_mst_port *port)
> +{
> +     struct drm_dp_mst_topology_state *old_mst_state =3D
> +             drm_atomic_get_old_mst_topology_state(state, mgr);
> +     struct drm_dp_mst_atomic_payload *old_payload =3D
> +             drm_atomic_get_mst_payload_state(old_mst_state, port);
> +     int time_slots;
> +
> +     time_slots =3D drm_dp_remove_current_payload_part2(mgr, state,
> port);
> +
> +     drm_WARN_ON(mgr->dev, time_slots !=3D old_payload->time_slots);
>  }
>  EXPORT_SYMBOL(drm_dp_remove_payload_part2);
> +
>  /**
>   * drm_dp_add_payload_part2() - Execute payload update part 2
>   * @mgr: Manager to use.
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 1c7f0b6afe475..3ab491d9c8d27 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -576,14 +576,6 @@ static void intel_mst_post_disable_dp(struct
> intel_atomic_state *state,
>       struct intel_dp *intel_dp =3D &dig_port->dp;
>       struct intel_connector *connector =3D
>               to_intel_connector(old_conn_state->connector);
> -     struct drm_dp_mst_topology_state *old_mst_state =3D
> -             drm_atomic_get_old_mst_topology_state(&state->base,
> &intel_dp->mst_mgr);
> -     struct drm_dp_mst_topology_state *new_mst_state =3D
> -             drm_atomic_get_new_mst_topology_state(&state->base,
> &intel_dp->mst_mgr);
> -     const struct drm_dp_mst_atomic_payload *old_payload =3D
> -             drm_atomic_get_mst_payload_state(old_mst_state,
> connector->port);
> -     struct drm_dp_mst_atomic_payload *new_payload =3D
> -             drm_atomic_get_mst_payload_state(new_mst_state,
> connector->port);
>       struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev);
>       bool last_mst_stream;
>
> @@ -604,8 +596,7 @@ static void intel_mst_post_disable_dp(struct
> intel_atomic_state *state,
>
>       wait_for_act_sent(encoder, old_crtc_state);
>
> -     drm_dp_remove_payload_part2(&intel_dp->mst_mgr,
> new_mst_state,
> -                                 old_payload, new_payload);
> +     drm_dp_remove_payload_part2(&intel_dp->mst_mgr, &state->base,
> +connector->port);
>
>       intel_ddi_disable_transcoder_func(old_crtc_state);
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index bba01fa0780c9..1ed724fe11f96 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -889,17 +889,13 @@ nv50_msto_cleanup(struct drm_atomic_state
> *state,
>       struct nouveau_drm *drm =3D nouveau_drm(msto->encoder.dev);
>       struct drm_dp_mst_atomic_payload *new_payload =3D
>               drm_atomic_get_mst_payload_state(new_mst_state, msto-
> >mstc->port);
> -     struct drm_dp_mst_topology_state *old_mst_state =3D
> -             drm_atomic_get_old_mst_topology_state(state, mgr);
> -     const struct drm_dp_mst_atomic_payload *old_payload =3D
> -             drm_atomic_get_mst_payload_state(old_mst_state, msto-
> >mstc->port);
>
>       NV_ATOMIC(drm, "%s: msto cleanup\n", msto->encoder.name);
>
>       if (msto->disabled) {
>               msto->mstc =3D NULL;
>               msto->disabled =3D false;
> -             drm_dp_remove_payload_part2(mgr, new_mst_state,
> old_payload, new_payload);
> +             drm_dp_remove_payload_part2(mgr, state, msto->mstc-
> >port);
>       } else if (msto->enabled) {
>               drm_dp_add_payload_part2(mgr, state, new_payload);
>               msto->enabled =3D false;
> diff --git a/include/drm/display/drm_dp_mst_helper.h
> b/include/drm/display/drm_dp_mst_helper.h
> index 4429d3b1745b6..9288501ffe8d2 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -856,9 +856,11 @@ void drm_dp_remove_payload_part1(struct
> drm_dp_mst_topology_mgr *mgr,
>                                struct drm_dp_mst_topology_state
> *mst_state,
>                                struct drm_dp_mst_atomic_payload
> *payload);  void drm_dp_remove_payload_part2(struct
> drm_dp_mst_topology_mgr *mgr,
> -                              struct drm_dp_mst_topology_state
> *mst_state,
> -                              const struct drm_dp_mst_atomic_payload
> *old_payload,
> -                              struct drm_dp_mst_atomic_payload
> *new_payload);
> +                              struct drm_atomic_state *state,
> +                              struct drm_dp_mst_port *port);
> +int drm_dp_remove_current_payload_part2(struct
> drm_dp_mst_topology_mgr *mgr,
> +                                     struct drm_atomic_state *state,
> +                                     struct drm_dp_mst_port *port);
>
>  int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr);
>
> > Thanks for helping me out here.
--
Regards,
Wayne

