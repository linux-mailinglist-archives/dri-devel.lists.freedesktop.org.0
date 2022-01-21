Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DFB4966A0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 21:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE70910E535;
	Fri, 21 Jan 2022 20:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE78310E511;
 Fri, 21 Jan 2022 20:51:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8u51FHibznXH7rdbNJbmbyca+W/FHE8q0j5sysQQuRSwr1lsr3EuplHVN0P7BEaVSd8dE7C4EPr97Wen0cmubao6iMhjyix3QRhYdF4Ch9zWRA0VKrV8wW+eCwUefFmgWSPQuU8XqJdWcaF5agZkyi0hXgSCzYJRLOnYgDzNeQc+sL4VtCPg6eM/pzdsrJgZUnVSYgoLcXC1aKNZy3kbdGPDuV1RHHR531IriOalloOcs1O3R6EmPJ9YYXWSE3sSAv6s2j62jh3olvzHd1MRrEEW7X51Ex/SYTDSb3PWbJ9gzttN1oAeN/ezfs/OprzjRTUJwyEtf4HJSGLVEbEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTtfzILM/Grc6DB5nC+dlzIeCzg1YQvhq5+3nFrDlNQ=;
 b=YfEJipwM3++xK6rzIWUmwjA3HMj6glGYT1rk7p5mUb3IdqWAmJhl65iKlu2Qo6El3uQaFM6TVGFajrlxmfh8SZ/EmWZG3HbGxXNf/sutXZtR8CR11AVL/d3fnEAyp93tSQFWioS6zSJIrMsvZouq6iqsb/BJtQZbJPxNAt6muiPABSmZQsSGgOS9oBmpPVJ66sCZU9Wh7Q41SkhuVapaxZOoT4blMStNVeJhCxfDM0bg/jxOx2dp1OOS8hh375yli6i3lNx7LXGwxiOljEfmLpy9a0MtX6zEu+XFSS2RpdIkZcfo7KB2+vNMRPjnEUd0v3pP+tTSyChcwIS2Kh12hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTtfzILM/Grc6DB5nC+dlzIeCzg1YQvhq5+3nFrDlNQ=;
 b=fZiXeCCSGNSj9ALhHFN4v/6bhwb7pb2E3lBGASIidGZFfRa0VUdonCSlELjqyXbFW4aqCERZKPkjsdSnsqfMLJaXOlUwas9t0fvNjt+5hYFcqlFms2pZXc9IuxMGtWtcjOdNyOt/jT+Lue7kF4zuc2KpwsI0OM1Q4+Cu5Ek/4XM=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by DM6PR12MB3833.namprd12.prod.outlook.com (2603:10b6:5:1cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Fri, 21 Jan
 2022 20:51:21 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::99d4:4d4f:653f:61be]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::99d4:4d4f:653f:61be%6]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 20:51:21 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>, Yongzhi Liu
 <lyz_cs@pku.edu.cn>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Lipski, Mikita" <Mikita.Lipski@amd.com>, "Lin, Wayne" <Wayne.Lin@amd.com>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Zuo, Jerry"
 <Jerry.Zuo@amd.com>, "Anson.Jacob@amd.com" <Anson.Jacob@amd.com>,
 "eryk.brol@amd.com" <eryk.brol@amd.com>, "Pillai, Aurabindo"
 <Aurabindo.Pillai@amd.com>, "Das, Nirmoy" <Nirmoy.Das@amd.com>
Subject: Re: [PATCH] drm/amd/display: Fix memory leak
Thread-Topic: [PATCH] drm/amd/display: Fix memory leak
Thread-Index: AQHYDroA5d26WvXZsUyg+IDnJgL/26xt1Z+AgAAeKwc=
Date: Fri, 21 Jan 2022 20:51:21 +0000
Message-ID: <BL1PR12MB51446C0B85C39EFC113FED14F75B9@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <1642764373-48563-1-git-send-email-lyz_cs@pku.edu.cn>
 <51258cfb-c3d4-ade3-0195-54835445d321@amd.com>
In-Reply-To: <51258cfb-c3d4-ade3-0195-54835445d321@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-01-21T20:51:20.736Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
suggested_attachment_session_id: 6ca9b336-97bd-694e-c8d6-9ddcb08a62bf
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7aad866-5b16-4966-597b-08d9dd1fc7f3
x-ms-traffictypediagnostic: DM6PR12MB3833:EE_
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR12MB3833F89F6F267A490ABAEB07F75B9@DM6PR12MB3833.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SxLXlGHujWnoAKrwhqsyZIP1r89prkCqW22W8cGF+Z6VP9WMQo365W9BrIz5RehbNVxICrWTmgxaSX9BUZ1E//xLe+O7WR9MyIuk0xgO/ox7c1gYikceC2QdG+pJRL7wWTy5vjgejUhqM+RRvRXQOo32J9MotiTAn0iLlWKLDYay69z7xn/aQU3BYauARUv4zlz4+ZUUx0QdDVr4vjFRi5STXQj6BnVsKjektOT0/LtU9A/S+kMvgkh/BM5IRuydqPuOepEdeVQTL0bCt1upefF9pCfTXAYEad/ymXeLvnCE/VqV5/f4wKofxveYqSREJlaPMy0uuUN0kHL9YLAnMoTO/gnNndChUBvbRXZ9vXZDNURGpB6PpL033pWn8S2SBDw2ukL/dvdjsEEqU8bh4IaRD8Dsu+v23Yy1jECwupYY3LEzWDoM9FcW7pdM/JPutE4S59cu0xX73aJtzg/3T619k1K6I7ty2Oi/A9zmFulaWqRn9lX6enHBVu5YKoL95u0aDtA9jWra2RdttxiahFSRYp958kJIAaGC+fHp8G5Pn102CjpmnRwaiX8Lv6xIcHXpGwHfABLin4BiorSfONTBbdAHQJ9v5cFKz5Tp/AngT/7M8wPVLUyclnm/j4QOtX9TfRNJ8zte17UpVreX1U8tv9/OlWQTn/Ffcsg8uyoJKJOHHS+H+9Td8a6CX1I4/5uPowJ+PzT+ye7lamZ3FZtS7tn79WntcxZbkuRBW/Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(9686003)(186003)(38100700002)(83380400001)(66946007)(110136005)(52536014)(6506007)(6636002)(19627405001)(66446008)(8676002)(66556008)(64756008)(26005)(66476007)(508600001)(54906003)(7696005)(53546011)(33656002)(316002)(2906002)(76116006)(71200400001)(55016003)(38070700005)(86362001)(4326008)(8936002)(122000001)(921005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mac0UTqhcGJfWVmk+Tqt5yJHTDSDL04zo/RR+UMI6+AYuXCiX2ZACfiq67mk?=
 =?us-ascii?Q?UmhMOa1BLr7sfHuzXjz/AQRzua7k7cUJ9ciHRFLnXqhj0JfMd9jSeqsZFQ+v?=
 =?us-ascii?Q?jM83o9N3+T3WJj65CXC3MP3vLKjMY3G8UIAWQJrgqUuleEtJy/zWZIdiwsXO?=
 =?us-ascii?Q?fNy7Cq9xLvbD17u8xAdvNMc7g6JZ//rwUYom5X03tP1OsUkSOSMGAu8uxqfN?=
 =?us-ascii?Q?l69NR3Io/7vMw5qEkoDMDQVCbRf4wa94lH9VcAh5pzmgm/59Np7YdTIVcN97?=
 =?us-ascii?Q?jYPqLPDQwhEaCiTpClif2sdUoDhHbxKh7GY3vxdl/x3tNkanNMPefpc3U7Od?=
 =?us-ascii?Q?1b8AQSfyId4UjE4NvNiNKz1zrGtHAwf2pdCe5R6LbxPLM0qv7B2U5Mf1CjjI?=
 =?us-ascii?Q?9zP/j3mMMXPDxHSJ1aEf1C91EFN3EmxMFvLUgTvCAHGmUX0XyGXHtBRXwvh0?=
 =?us-ascii?Q?EZ93hI5nO9sdPjRWl6WX9q6uAZcKUzMOMNBgHLIQnhgXUzdmJ7VNic3NFwC/?=
 =?us-ascii?Q?F4Nh7SuoCcSZc2MrqDeNksrgehQa/RjEbHt6Q7dV4iVBRPrtlu3Pj/EL+gx3?=
 =?us-ascii?Q?NQvBcIG9QxMFeO5ce9yVtgbZibv/rJhxkzPgbNGIODcZsA7xmpuY5GXg5+0t?=
 =?us-ascii?Q?TrymiNmdlqsZz6LoMXE0Q79ZRRNHmXzUnjXYJNuANdr+ZCejGua/ZSHRw2Ga?=
 =?us-ascii?Q?oWjXQefdAV6kvlXplX2HaEavUfVGkt5GPXUdRdsyFP2fUlaNh3GhmyCVTUkr?=
 =?us-ascii?Q?kJLoxnOwkiZ+xGPNyRt3BY+IOy6D9ekewFcpoxn3c/rXa4YXyK4ac2HCvytt?=
 =?us-ascii?Q?AQ+PtGaJQ90MyuoPmwPDtUq/vWdDh8Yq1VZtITWCRhzt6svjkS+zm2BwYQAX?=
 =?us-ascii?Q?0d1aiKRLdg2jmcSPsoJidCl3hViamrblknpwP6DJYOkSyUzM/1S/ccbJzcSJ?=
 =?us-ascii?Q?paUtoorxNdehItuALoqiOmD/06FFBvyrRghmMpZUDQS059/zlZx6km0sOyuK?=
 =?us-ascii?Q?rEINLAyR8eTFDXMgNJw/ziJi+bVBUxl/ydpJf5MY1uYhADNTKPZKkfs2EASJ?=
 =?us-ascii?Q?5U/CmbW549dg5E8yqo89zX3pLDy1O7viCm9uLElz1VhStSQr0fhJobgDKRZa?=
 =?us-ascii?Q?dHXfOoEzY33Jt9oD9EfAAFbKKCr1gcY/5DUcDzymh82ZDkqrt3ELwBDB81Xe?=
 =?us-ascii?Q?8ViPcPFuzxmOaYstvhjv89eMNwQVgucYBmtXqlI5grwU4H6HjRrCihztnCEC?=
 =?us-ascii?Q?7nWBNFG0wVoTqGO60yrKDx1gi7CSPjeVgXUv4HfbXvpnwXB3YpPG8ySXeZrm?=
 =?us-ascii?Q?wNagH1WnQoXzSeOrAvcBB0YwmroLnUDavYyZFz5ocy2glTZkFC5XFv2lPsEG?=
 =?us-ascii?Q?rEJAdJAv4bjAVmW21j9/EB7v3/hxXynu2yNDyDu8dCWU9IAOZlDybpRqzH4g?=
 =?us-ascii?Q?B9AhnoU6bRGfr0VEEZRjlDkSpRHLAc99l9HfMnC2l3pUZpHckB5FyqUB0Zwf?=
 =?us-ascii?Q?GWZ/ZBC8xBaOiu14zOvD4DjSzX+zBTbhLLqzAFHqCwWHBGkREpdC2TBF+d4+?=
 =?us-ascii?Q?U5sb9P7iv6VF/6Yi/M9ly2/CR2NTXA+E5CdnoEuxP9CoOVnRVeGEYoUMX+m5?=
 =?us-ascii?Q?emk8uB+9+KVozWEUmaAFLoE=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB51446C0B85C39EFC113FED14F75B9BL1PR12MB5144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7aad866-5b16-4966-597b-08d9dd1fc7f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 20:51:21.6412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQ/ofCJK9x3J1oVLbF+muP/a5qt7sfdNSVJk/26FlHhtds548s20BrH7L3GYiLl8dT+lZi+ZtOI6qggipIsolA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3833
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BL1PR12MB51446C0B85C39EFC113FED14F75B9BL1PR12MB5144namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

Applied.  Thanks!
________________________________
From: Wentland, Harry <Harry.Wentland@amd.com>
Sent: Friday, January 21, 2022 2:03 PM
To: Yongzhi Liu <lyz_cs@pku.edu.cn>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com=
>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Deucher, Alexander <Alexan=
der.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xi=
nhui <Xinhui.Pan@amd.com>; airlied@linux.ie <airlied@linux.ie>; daniel@ffwl=
l.ch <daniel@ffwll.ch>; Lipski, Mikita <Mikita.Lipski@amd.com>; Lin, Wayne =
<Wayne.Lin@amd.com>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Zu=
o, Jerry <Jerry.Zuo@amd.com>; Anson.Jacob@amd.com <Anson.Jacob@amd.com>; er=
yk.brol@amd.com <eryk.brol@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai@am=
d.com>; Das, Nirmoy <Nirmoy.Das@amd.com>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-kernel@vge=
r.kernel.org <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/amd/display: Fix memory leak

On 2022-01-21 06:26, Yongzhi Liu wrote:
> [why]
> Resource release is needed on the error handling path
> to prevent memory leak.
>
> [how]
> Fix this by adding kfree on the error handling path.
>
> Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 80 ++++++++++++++++=
------
>  1 file changed, 60 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index ded64d0..e463d46 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -227,8 +227,10 @@ static ssize_t dp_link_settings_read(struct file *f,=
 char __user *buf,
>                        break;
>
>                r =3D put_user(*(rd_buf + result), buf);
> -             if (r)
> +             if (r) {
> +                     kfree(rd_buf);
>                        return r; /* r =3D -EFAULT */
> +             }
>
>                buf +=3D 1;
>                size -=3D 1;
> @@ -389,8 +391,10 @@ static ssize_t dp_phy_settings_read(struct file *f, =
char __user *buf,
>                        break;
>
>                r =3D put_user((*(rd_buf + result)), buf);
> -             if (r)
> +             if (r) {
> +                     kfree(rd_buf);
>                        return r; /* r =3D -EFAULT */
> +             }
>
>                buf +=3D 1;
>                size -=3D 1;
> @@ -1359,8 +1363,10 @@ static ssize_t dp_dsc_clock_en_read(struct file *f=
, char __user *buf,
>                                break;
>        }
>
> -     if (!pipe_ctx)
> +     if (!pipe_ctx) {
> +             kfree(rd_buf);
>                return -ENXIO;
> +     }
>
>        dsc =3D pipe_ctx->stream_res.dsc;
>        if (dsc)
> @@ -1376,8 +1382,10 @@ static ssize_t dp_dsc_clock_en_read(struct file *f=
, char __user *buf,
>                        break;
>
>                r =3D put_user(*(rd_buf + result), buf);
> -             if (r)
> +             if (r) {
> +                     kfree(rd_buf);
>                        return r; /* r =3D -EFAULT */
> +             }
>
>                buf +=3D 1;
>                size -=3D 1;
> @@ -1546,8 +1554,10 @@ static ssize_t dp_dsc_slice_width_read(struct file=
 *f, char __user *buf,
>                                break;
>        }
>
> -     if (!pipe_ctx)
> +     if (!pipe_ctx) {
> +             kfree(rd_buf);
>                return -ENXIO;
> +     }
>
>        dsc =3D pipe_ctx->stream_res.dsc;
>        if (dsc)
> @@ -1563,8 +1573,10 @@ static ssize_t dp_dsc_slice_width_read(struct file=
 *f, char __user *buf,
>                        break;
>
>                r =3D put_user(*(rd_buf + result), buf);
> -             if (r)
> +             if (r) {
> +                     kfree(rd_buf);
>                        return r; /* r =3D -EFAULT */
> +             }
>
>                buf +=3D 1;
>                size -=3D 1;
> @@ -1731,8 +1743,10 @@ static ssize_t dp_dsc_slice_height_read(struct fil=
e *f, char __user *buf,
>                                break;
>        }
>
> -     if (!pipe_ctx)
> +     if (!pipe_ctx) {
> +             kfree(rd_buf);
>                return -ENXIO;
> +     }
>
>        dsc =3D pipe_ctx->stream_res.dsc;
>        if (dsc)
> @@ -1748,8 +1762,10 @@ static ssize_t dp_dsc_slice_height_read(struct fil=
e *f, char __user *buf,
>                        break;
>
>                r =3D put_user(*(rd_buf + result), buf);
> -             if (r)
> +             if (r) {
> +                     kfree(rd_buf);
>                        return r; /* r =3D -EFAULT */
> +             }
>
>                buf +=3D 1;
>                size -=3D 1;
> @@ -1912,8 +1928,10 @@ static ssize_t dp_dsc_bits_per_pixel_read(struct f=
ile *f, char __user *buf,
>                                break;
>        }
>
> -     if (!pipe_ctx)
> +     if (!pipe_ctx) {
> +             kfree(rd_buf);
>                return -ENXIO;
> +     }
>
>        dsc =3D pipe_ctx->stream_res.dsc;
>        if (dsc)
> @@ -1929,8 +1947,10 @@ static ssize_t dp_dsc_bits_per_pixel_read(struct f=
ile *f, char __user *buf,
>                        break;
>
>                r =3D put_user(*(rd_buf + result), buf);
> -             if (r)
> +             if (r) {
> +                     kfree(rd_buf);
>                        return r; /* r =3D -EFAULT */
> +             }
>
>                buf +=3D 1;
>                size -=3D 1;
> @@ -2088,8 +2108,10 @@ static ssize_t dp_dsc_pic_width_read(struct file *=
f, char __user *buf,
>                                break;
>        }
>
> -     if (!pipe_ctx)
> +     if (!pipe_ctx) {
> +             kfree(rd_buf);
>                return -ENXIO;
> +     }
>
>        dsc =3D pipe_ctx->stream_res.dsc;
>        if (dsc)
> @@ -2105,8 +2127,10 @@ static ssize_t dp_dsc_pic_width_read(struct file *=
f, char __user *buf,
>                        break;
>
>                r =3D put_user(*(rd_buf + result), buf);
> -             if (r)
> +             if (r) {
> +                     kfree(rd_buf);
>                        return r; /* r =3D -EFAULT */
> +             }
>
>                buf +=3D 1;
>                size -=3D 1;
> @@ -2145,8 +2169,10 @@ static ssize_t dp_dsc_pic_height_read(struct file =
*f, char __user *buf,
>                                break;
>        }
>
> -     if (!pipe_ctx)
> +     if (!pipe_ctx) {
> +             kfree(rd_buf);
>                return -ENXIO;
> +     }
>
>        dsc =3D pipe_ctx->stream_res.dsc;
>        if (dsc)
> @@ -2162,8 +2188,10 @@ static ssize_t dp_dsc_pic_height_read(struct file =
*f, char __user *buf,
>                        break;
>
>                r =3D put_user(*(rd_buf + result), buf);
> -             if (r)
> +             if (r) {
> +                     kfree(rd_buf);
>                        return r; /* r =3D -EFAULT */
> +             }
>
>                buf +=3D 1;
>                size -=3D 1;
> @@ -2217,8 +2245,10 @@ static ssize_t dp_dsc_chunk_size_read(struct file =
*f, char __user *buf,
>                                break;
>        }
>
> -     if (!pipe_ctx)
> +     if (!pipe_ctx) {
> +             kfree(rd_buf);
>                return -ENXIO;
> +     }
>
>        dsc =3D pipe_ctx->stream_res.dsc;
>        if (dsc)
> @@ -2234,8 +2264,10 @@ static ssize_t dp_dsc_chunk_size_read(struct file =
*f, char __user *buf,
>                        break;
>
>                r =3D put_user(*(rd_buf + result), buf);
> -             if (r)
> +             if (r) {
> +                     kfree(rd_buf);
>                        return r; /* r =3D -EFAULT */
> +             }
>
>                buf +=3D 1;
>                size -=3D 1;
> @@ -2289,8 +2321,10 @@ static ssize_t dp_dsc_slice_bpg_offset_read(struct=
 file *f, char __user *buf,
>                                break;
>        }
>
> -     if (!pipe_ctx)
> +     if (!pipe_ctx) {
> +             kfree(rd_buf);
>                return -ENXIO;
> +     }
>
>        dsc =3D pipe_ctx->stream_res.dsc;
>        if (dsc)
> @@ -2306,8 +2340,10 @@ static ssize_t dp_dsc_slice_bpg_offset_read(struct=
 file *f, char __user *buf,
>                        break;
>
>                r =3D put_user(*(rd_buf + result), buf);
> -             if (r)
> +             if (r) {
> +                     kfree(rd_buf);
>                        return r; /* r =3D -EFAULT */
> +             }
>
>                buf +=3D 1;
>                size -=3D 1;
> @@ -3459,8 +3495,10 @@ static ssize_t dcc_en_bits_read(
>        dc->hwss.get_dcc_en_bits(dc, dcc_en_bits);
>
>        rd_buf =3D kcalloc(rd_buf_size, sizeof(char), GFP_KERNEL);
> -     if (!rd_buf)
> +     if (!rd_buf) {
> +             kfree(dcc_en_bits);
>                return -ENOMEM;
> +     }
>
>        for (i =3D 0; i < num_pipes; i++)
>                offset +=3D snprintf(rd_buf + offset, rd_buf_size - offset=
,
> @@ -3473,8 +3511,10 @@ static ssize_t dcc_en_bits_read(
>                if (*pos >=3D rd_buf_size)
>                        break;
>                r =3D put_user(*(rd_buf + result), buf);
> -             if (r)
> +             if (r) {
> +                     kfree(rd_buf);
>                        return r; /* r =3D -EFAULT */
> +             }
>                buf +=3D 1;
>                size -=3D 1;
>                *pos +=3D 1;


--_000_BL1PR12MB51446C0B85C39EFC113FED14F75B9BL1PR12MB5144namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;" al=
ign=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Applied.&nbsp; Thanks!<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Wentland, Harry &lt;H=
arry.Wentland@amd.com&gt;<br>
<b>Sent:</b> Friday, January 21, 2022 2:03 PM<br>
<b>To:</b> Yongzhi Liu &lt;lyz_cs@pku.edu.cn&gt;; Li, Sun peng (Leo) &lt;Su=
npeng.Li@amd.com&gt;; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; D=
eucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Christian &lt;=
Christian.Koenig@amd.com&gt;; Pan, Xinhui &lt;Xinhui.Pan@amd.com&gt;;
 airlied@linux.ie &lt;airlied@linux.ie&gt;; daniel@ffwll.ch &lt;daniel@ffwl=
l.ch&gt;; Lipski, Mikita &lt;Mikita.Lipski@amd.com&gt;; Lin, Wayne &lt;Wayn=
e.Lin@amd.com&gt;; Kazlauskas, Nicholas &lt;Nicholas.Kazlauskas@amd.com&gt;=
; Zuo, Jerry &lt;Jerry.Zuo@amd.com&gt;; Anson.Jacob@amd.com &lt;Anson.Jacob=
@amd.com&gt;;
 eryk.brol@amd.com &lt;eryk.brol@amd.com&gt;; Pillai, Aurabindo &lt;Aurabin=
do.Pillai@amd.com&gt;; Das, Nirmoy &lt;Nirmoy.Das@amd.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt=
;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amd/display: Fix memory leak</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 2022-01-21 06:26, Yongzhi Liu wrote:<br>
&gt; [why]<br>
&gt; Resource release is needed on the error handling path<br>
&gt; to prevent memory leak.<br>
&gt; <br>
&gt; [how]<br>
&gt; Fix this by adding kfree on the error handling path.<br>
&gt; <br>
&gt; Signed-off-by: Yongzhi Liu &lt;lyz_cs@pku.edu.cn&gt;<br>
<br>
Reviewed-by: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
<br>
Harry<br>
<br>
&gt; ---<br>
&gt;&nbsp; .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c&nbsp; | 80 +++=
+++++++++++++------<br>
&gt;&nbsp; 1 file changed, 60 insertions(+), 20 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c=
 b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c<br>
&gt; index ded64d0..e463d46 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c<br>
&gt; +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c<br>
&gt; @@ -227,8 +227,10 @@ static ssize_t dp_link_settings_read(struct file =
*f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; r =3D put_user(*(rd_buf + result), buf);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
r; /* r =3D -EFAULT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; buf +=3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; size -=3D 1;<br>
&gt; @@ -389,8 +391,10 @@ static ssize_t dp_phy_settings_read(struct file *=
f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; r =3D put_user((*(rd_buf + result)), buf);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
r; /* r =3D -EFAULT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; buf +=3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; size -=3D 1;<br>
&gt; @@ -1359,8 +1363,10 @@ static ssize_t dp_dsc_clock_en_read(struct file=
 *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENXIO;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dsc =3D pipe_ctx-&gt;stream_=
res.dsc;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dsc)<br>
&gt; @@ -1376,8 +1382,10 @@ static ssize_t dp_dsc_clock_en_read(struct file=
 *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; r =3D put_user(*(rd_buf + result), buf);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
r; /* r =3D -EFAULT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; buf +=3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; size -=3D 1;<br>
&gt; @@ -1546,8 +1554,10 @@ static ssize_t dp_dsc_slice_width_read(struct f=
ile *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENXIO;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dsc =3D pipe_ctx-&gt;stream_=
res.dsc;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dsc)<br>
&gt; @@ -1563,8 +1573,10 @@ static ssize_t dp_dsc_slice_width_read(struct f=
ile *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; r =3D put_user(*(rd_buf + result), buf);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
r; /* r =3D -EFAULT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; buf +=3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; size -=3D 1;<br>
&gt; @@ -1731,8 +1743,10 @@ static ssize_t dp_dsc_slice_height_read(struct =
file *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENXIO;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dsc =3D pipe_ctx-&gt;stream_=
res.dsc;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dsc)<br>
&gt; @@ -1748,8 +1762,10 @@ static ssize_t dp_dsc_slice_height_read(struct =
file *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; r =3D put_user(*(rd_buf + result), buf);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
r; /* r =3D -EFAULT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; buf +=3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; size -=3D 1;<br>
&gt; @@ -1912,8 +1928,10 @@ static ssize_t dp_dsc_bits_per_pixel_read(struc=
t file *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENXIO;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dsc =3D pipe_ctx-&gt;stream_=
res.dsc;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dsc)<br>
&gt; @@ -1929,8 +1947,10 @@ static ssize_t dp_dsc_bits_per_pixel_read(struc=
t file *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; r =3D put_user(*(rd_buf + result), buf);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
r; /* r =3D -EFAULT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; buf +=3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; size -=3D 1;<br>
&gt; @@ -2088,8 +2108,10 @@ static ssize_t dp_dsc_pic_width_read(struct fil=
e *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENXIO;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dsc =3D pipe_ctx-&gt;stream_=
res.dsc;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dsc)<br>
&gt; @@ -2105,8 +2127,10 @@ static ssize_t dp_dsc_pic_width_read(struct fil=
e *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; r =3D put_user(*(rd_buf + result), buf);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
r; /* r =3D -EFAULT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; buf +=3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; size -=3D 1;<br>
&gt; @@ -2145,8 +2169,10 @@ static ssize_t dp_dsc_pic_height_read(struct fi=
le *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENXIO;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dsc =3D pipe_ctx-&gt;stream_=
res.dsc;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dsc)<br>
&gt; @@ -2162,8 +2188,10 @@ static ssize_t dp_dsc_pic_height_read(struct fi=
le *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; r =3D put_user(*(rd_buf + result), buf);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
r; /* r =3D -EFAULT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; buf +=3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; size -=3D 1;<br>
&gt; @@ -2217,8 +2245,10 @@ static ssize_t dp_dsc_chunk_size_read(struct fi=
le *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENXIO;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dsc =3D pipe_ctx-&gt;stream_=
res.dsc;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dsc)<br>
&gt; @@ -2234,8 +2264,10 @@ static ssize_t dp_dsc_chunk_size_read(struct fi=
le *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; r =3D put_user(*(rd_buf + result), buf);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
r; /* r =3D -EFAULT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; buf +=3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; size -=3D 1;<br>
&gt; @@ -2289,8 +2321,10 @@ static ssize_t dp_dsc_slice_bpg_offset_read(str=
uct file *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_ctx) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENXIO;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dsc =3D pipe_ctx-&gt;stream_=
res.dsc;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dsc)<br>
&gt; @@ -2306,8 +2340,10 @@ static ssize_t dp_dsc_slice_bpg_offset_read(str=
uct file *f, char __user *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; r =3D put_user(*(rd_buf + result), buf);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
r; /* r =3D -EFAULT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; buf +=3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; size -=3D 1;<br>
&gt; @@ -3459,8 +3495,10 @@ static ssize_t dcc_en_bits_read(<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc-&gt;hwss.get_dcc_en_bits(=
dc, dcc_en_bits);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rd_buf =3D kcalloc(rd_buf_si=
ze, sizeof(char), GFP_KERNEL);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (!rd_buf)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!rd_buf) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kfree(dcc_en_bits);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; num_pip=
es; i++)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; offset +=3D snprintf(rd_buf + offset, rd_buf_size - off=
set,<br>
&gt; @@ -3473,8 +3511,10 @@ static ssize_t dcc_en_bits_read(<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (*pos &gt;=3D rd_buf_size)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; r =3D put_user(*(rd_buf + result), buf);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(rd_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
r; /* r =3D -EFAULT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; buf +=3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; size -=3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; *pos +=3D 1;<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BL1PR12MB51446C0B85C39EFC113FED14F75B9BL1PR12MB5144namp_--
