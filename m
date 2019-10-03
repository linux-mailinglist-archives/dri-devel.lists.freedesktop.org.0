Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556C3C9892
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 08:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1140C6E241;
	Thu,  3 Oct 2019 06:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720059.outbound.protection.outlook.com [40.107.72.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D626E22F;
 Thu,  3 Oct 2019 06:49:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBvlTbex54UK0zxeTZAvMIzbpx/wD4M+HY/zmQlA5xtv0UfdP7U6hBxiKYuy2DnC5wzy3JAWt6Us95lj51wyAAi+DbAbkNx6B/GVLpON8Clgfi+sSB/viBJTPK3VisHH1C6nanEo1KK0xUmrxb+TofQ0pVi1nOj9xo+bYL0kyNl9jQ5Xvat36EvCL59l9y4NmTyCiv4sED6UL9MqPaccNJ1x6f6+U4M7kYhoHq8A7XFzwe3nAgNfLSbylkBQ7akz6Vp+NV7QH62cfFYZu4FzDqS57uBikN0iZ7eeKrfNzVnBwKThBGhuuCO+8UchJqj6GdTWIwpeAsiIMsTS759FUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dR8M2HmiJ70h3TPp6hHdYlgB3xQ6Y5fXX4yUKxKheo=;
 b=kdPBaSutT5Xj7Iz0YPBYcheXrGk3AHqdOeW56ZyBRUzuwD07P6twnTl7Pt0P1Dfpt2QVmsvppZdkeNIAe0ilpatDZlhxnB4boYef5XiYUsQwgGGHPy5a2/IHmBQGPAeiIhmhzqzT6NuJtCSz8iZMhBwqyIHIGtZZtBdTFN878q5UOsFFoTmdZ7+9kufnS0HDU3f5ZP0vP3DyXfoF58F5F5u7zkpzvfWimqL8HRLhV97/uQFJpiT7qU3brd6evPFsvu2q6u/XRSHgFwo+K8ChBSOtLxXMcd2DJ7JNXEZaWiozrQT1JTpM+MGLyilb2uAHvjWtfiG5Ch4RlNulTcklqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB4203.namprd12.prod.outlook.com (10.141.187.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.18; Thu, 3 Oct 2019 06:49:05 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::9c:ce1f:b89f:18dd]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::9c:ce1f:b89f:18dd%3]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 06:49:05 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/drm_edid: correct VIC and HDMI_VIC under HDMI 2.0
Thread-Topic: [PATCH] drm/drm_edid: correct VIC and HDMI_VIC under HDMI 2.0
Thread-Index: AQHVcpigTjVQ3e4VoUG7esC7UCtOEadHTB2AgAErWAg=
Date: Thu, 3 Oct 2019 06:49:05 +0000
Message-ID: <DM6PR12MB41378F46947DCC2C46494AC8FC9F0@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20190924052621.6851-1-Wayne.Lin@amd.com>,
 <20191002115807.GT1208@intel.com>
In-Reply-To: <20191002115807.GT1208@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.68.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5bf8332-aea4-4c94-5c91-08d747cdc874
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB4203:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4203F3542C90D94EF287778BFC9F0@DM6PR12MB4203.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(199004)(189003)(99286004)(6436002)(186003)(76176011)(478600001)(6916009)(6306002)(55016002)(236005)(54896002)(9686003)(71200400001)(71190400001)(66066001)(26005)(25786009)(105004)(2906002)(74316002)(19627405001)(54906003)(14454004)(33656002)(606006)(7736002)(7696005)(966005)(316002)(229853002)(6116002)(6246003)(66446008)(6506007)(66556008)(64756008)(66946007)(66476007)(3846002)(476003)(486006)(102836004)(81166006)(8676002)(81156014)(53546011)(4326008)(8936002)(256004)(11346002)(5660300002)(76116006)(86362001)(52536014)(446003)(91956017);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4203;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2o6ywmlcglV7Ylk8JXCVCrRD0gvlGAiHR+O1qmCPiK96DBZtjBwSE6jZEmzd3vM+h6HoWaC7hwFUyHnhu22HYHDBSY7TGk80cE6GLv6pw74wQa6YBoLI4/VPKmhPxxhLJAxC4p3Nc4vO7MTxLJ76ZTJWGaAkwS7hoD/RFb+OVBu4B7PobVbYOn3UUWcfQCmZu4xVa3RMt/0xssviw0yXxC9AaWEReHMLJMo8nCyPr0PG7SUNJDA8FmJxdj5sKgO5dW9pRzW+3IDYH4n5z82h+eedh1Ik5Y99aA9S2qgIy1scdXi6XFe13NU8QOJcI2FuSvv4f1176XzEQxgggeXi3QaON4q1cToKrqnJ/IJ3OFtabUJy4nKPSul6UfGk5fMUpzTJOtC7hYGRCaDomkWJos2oH8ZqmBCXZq8+me3rmb3rreZj45VSYSKlQiHclqbwMCactnmb1Rh1T1ctj86MsA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5bf8332-aea4-4c94-5c91-08d747cdc874
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 06:49:05.2370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iLHXcs8gboTYZEGb8JvjcaLoD0oLu3/uZrDLyra3kpwVkH1H99oyMvLvgxlMnvioOtMyBFJxtEvIdJm7HL60AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4203
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dR8M2HmiJ70h3TPp6hHdYlgB3xQ6Y5fXX4yUKxKheo=;
 b=v899Lv4RwkdobvLzefeqMcuNL0yfllwJaFzOPII0wc453mCt98GjbhfyWl5mwyqKVr4tm4IgNul6yjrB5wBr4v10UxCVbPkVYoikB3KHY3It5N9exSsFpP6Q+MCqzJls6BfjmW0FKHGxbsaolw6fJ4LtTwh+e/DGFBbqnFlz1+0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============1658414142=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1658414142==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB41378F46947DCC2C46494AC8FC9F0DM6PR12MB4137namp_"

--_000_DM6PR12MB41378F46947DCC2C46494AC8FC9F0DM6PR12MB4137namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
Sent: Wednesday, October 2, 2019 19:58
To: Lin, Wayne <Wayne.Lin@amd.com>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-=
gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Li, Sun peng (Le=
o) <Sunpeng.Li@amd.com>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
Subject: Re: [PATCH] drm/drm_edid: correct VIC and HDMI_VIC under HDMI 2.0

On Tue, Sep 24, 2019 at 01:26:21PM +0800, Wayne Lin wrote:
> In HDMI 1.4 defines 4k modes without specific aspect ratio.
> However, in HDMI 2.0, adds aspect ratio attribute to distinguish differen=
t
> 4k modes.
>
> According to Appendix E of HDMI 2.0 spec, source should use VSIF to
> indicate VIC mode only when the mode is one defined in HDMI 1.4b 4K modes=
.
> Otherwise, use AVI infoframes to convey VIC.
>
> eg: VIC_103 should use AVI infoframes and VIC_93 use VSIF
>
> When the sink is HDMI 2.0, current code in
> drm_hdmi_avi_infoframe_from_display_mode will also force mode VIC_103 to
> have VIC value 0. This violates the spec and needs to be corrected.

> Where is that being done? We only set the AVI VIC to zero if we're going
> to use the HDMI VIC instead.

Appreciate for your time and apologize for not explaining it clearly.
Current code in drm_hdmi_avi_infoframe_from_display_mode() will call
drm_match_hdmi_mode() to set up vendor_if_vic. By checking
drm_valid_hdmi_vic(vendor_if_vic) to see if the vic info should be conveyed=
 by avi
or not.

But in drm_match_hdmi_mode(), code doesn't enable match_flags with
DRM_MODE_MATCH_ASPECT_RATIO. I think it's due to HDMI1.4b doesn't specify
4K mode conveyed by HDMI VIC with particular aspect ratio. But in Appendix =
E of
HDMI 2.0 spec, it specify only 4k modes with particular aspect ratio should=
 use VSIF to convey.
Hence, when the sink support HDMI 2.0 and set the mode to be VIC_103, calli=
ng
drm_match_hdmi_mode(mode) will return vendor_if_vic =3D 3 (VIC_93 and VIC_1=
03 are having
the same timing but different aspect ratio). Thereafter will set the  frame=
->video_code to 0.
However, VIC_103 should use AVI VIC according to HDMI 2.0 spec (only VIC: 9=
3, 94, 95 &
98 should use VSIF).

This patch try to revise that, when the sink support HDMI 2.0, drm_match_hd=
mi_mode()
should also take aspect ratio into consideration.
But for easy reading, I add another function "drm_match_hdmi_1_4_mode" to d=
o so.

> The same situation occurs in drm_hdmi_vendor_infoframe_from_display_mode
> and should set HDMI_VIC when the mode is one defined in HDMI 1.4b 4K
> modes.

> Yes, and we do that. "vic =3D drm_match_hdmi_mode(mode);"

> Apart from adding the aspect ratios I don't really understand what
> you're trying to achieve here.

For HDMI 2.0 sink, drm_match_hdmi_mode() should also take aspect ratio into=
 consideration.
Once again, very appreciate for your time.

> ---
>  drivers/gpu/drm/drm_edid.c | 95 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 92 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 649cfd8b4200..0fea9bf4ec67 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1306,6 +1306,37 @@ static const struct drm_display_mode edid_4k_modes=
[] =3D {
>          .vrefresh =3D 24, },
>  };
>
> +/*
> + * 4k modes of HDMI 1.4 defined in HDMI 2.0. Index using the VIC.
> + */
> +static const struct drm_display_mode hdmi_1_4_edid_4k_modes[] =3D {
> +     /* 0 - dummy, VICs start at 1 */
> +     { },
> +     /* 1 - 3840x2160@30Hz */
> +     { DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 297000,
> +                3840, 4016, 4104, 4400, 0,
> +                2160, 2168, 2178, 2250, 0,
> +                DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> +       .vrefresh =3D 30, .picture_aspect_ratio =3D HDMI_PICTURE_ASPECT_1=
6_9, },
> +     /* 2 - 3840x2160@25Hz */
> +     { DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 297000,
> +                3840, 4896, 4984, 5280, 0,
> +                2160, 2168, 2178, 2250, 0,
> +                DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> +       .vrefresh =3D 25, .picture_aspect_ratio =3D HDMI_PICTURE_ASPECT_1=
6_9, },
> +     /* 3 - 3840x2160@24Hz */
> +     { DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 297000,
> +                3840, 5116, 5204, 5500, 0,
> +                2160, 2168, 2178, 2250, 0,
> +                DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> +       .vrefresh =3D 24, .picture_aspect_ratio =3D HDMI_PICTURE_ASPECT_1=
6_9, },
> +     /* 4 - 4096x2160@24Hz (SMPTE) */
> +     { DRM_MODE("4096x2160", DRM_MODE_TYPE_DRIVER, 297000,
> +                4096, 5116, 5204, 5500, 0,
> +                2160, 2168, 2178, 2250, 0,
> +                DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> +       .vrefresh =3D 24, .picture_aspect_ratio =3D HDMI_PICTURE_ASPECT_2=
56_135, },
> +};
>  /*** DDC fetch and block validation ***/
>
>  static const u8 edid_header[] =3D {
> @@ -3061,6 +3092,19 @@ hdmi_mode_alternate_clock(const struct drm_display=
_mode *hdmi_mode)
>        return cea_mode_alternate_clock(hdmi_mode);
>  }
>
> +/*
> + * Calculate the alternate clock for HDMI modes (those from the HDMI ven=
dor
> + * specific block).
> + *
> + * It's almost like hdmi_mode_alternate_clock(), but no exception for VI=
C 4 mode.
> + * There is an alternate clock (23.98Hz) of VIC 4 mode (4096x2160@24Hz) =
in HDMI 2.0
> + */
> +static unsigned int
> +hdmi_1_4_mode_alternate_clock(const struct drm_display_mode *hdmi_mode)
> +{
> +     return cea_mode_alternate_clock(hdmi_mode);
> +}
> +
>  static u8 drm_match_hdmi_mode_clock_tolerance(const struct drm_display_m=
ode *to_match,
>                                              unsigned int clock_tolerance=
)
>  {
> @@ -3121,11 +3165,53 @@ static u8 drm_match_hdmi_mode(const struct drm_di=
splay_mode *to_match)
>        return 0;
>  }
>
> +/*
> + * drm_match_hdmi_1_4_mode - look for a HDMI 1.4 mode matching given mod=
e
> + * @to_match: display mode
> + *
> + * An HDMI mode is one defined in the HDMI vendor specific block.
> + * In HDMI 2.0, only few 4k resolutions with specific aspect ratio shoul=
d
> + * utilize H14b VSIF.
> + *
> + * Returns the HDMI Video ID (VIC) of the mode or 0 if it isn't one.
> + */
> +static u8 drm_match_hdmi_1_4_mode(const struct drm_display_mode *to_matc=
h)
> +{
> +     unsigned int match_flags =3D DRM_MODE_MATCH_TIMINGS | DRM_MODE_MATC=
H_FLAGS;
> +     u8 vic;
> +
> +     if (!to_match->clock)
> +             return 0;
> +
> +     if (to_match->picture_aspect_ratio)
> +             match_flags |=3D DRM_MODE_MATCH_ASPECT_RATIO;
> +
> +     for (vic =3D 1; vic < ARRAY_SIZE(hdmi_1_4_edid_4k_modes); vic++) {
> +             const struct drm_display_mode *hdmi_1_4_mode =3D &hdmi_1_4_=
edid_4k_modes[vic];
> +             unsigned int clock1, clock2;
> +
> +             /* Make sure to also match alternate clocks */
> +             clock1 =3D hdmi_1_4_mode->clock;
> +             clock2 =3D hdmi_1_4_mode_alternate_clock(hdmi_1_4_mode);
> +
> +             if ((KHZ2PICOS(to_match->clock) =3D=3D KHZ2PICOS(clock1) ||
> +                  KHZ2PICOS(to_match->clock) =3D=3D KHZ2PICOS(clock2)) &=
&
> +                 drm_mode_match(to_match, hdmi_1_4_mode, match_flags))
> +                     return vic;
> +     }
> +     return 0;
> +}
> +
>  static bool drm_valid_hdmi_vic(u8 vic)
>  {
>        return vic > 0 && vic < ARRAY_SIZE(edid_4k_modes);
>  }
>
> +static bool drm_valid_hdmi_1_4_vic(u8 vic)
> +{
> +     return vic > 0 && vic < ARRAY_SIZE(hdmi_1_4_edid_4k_modes);
> +}
> +
>  static int
>  add_alternate_cea_modes(struct drm_connector *connector, struct edid *ed=
id)
>  {
> @@ -4894,10 +4980,12 @@ drm_hdmi_avi_infoframe_from_display_mode(struct h=
dmi_avi_infoframe *frame,
>         * HDMI 1.4b 4K modes
>         */
>        if (frame->video_code) {
> -             u8 vendor_if_vic =3D drm_match_hdmi_mode(mode);
> +             u8 vendor_if_vic =3D is_hdmi2_sink(connector) ?
> +                     drm_match_hdmi_1_4_mode(mode) : drm_match_hdmi_mode=
(mode);
>                bool is_s3d =3D mode->flags & DRM_MODE_FLAG_3D_MASK;
>
> -             if (drm_valid_hdmi_vic(vendor_if_vic) && !is_s3d)
> +             if (!is_s3d && is_hdmi2_sink(connector) ?
> +                     drm_valid_hdmi_1_4_vic(vendor_if_vic) : drm_valid_h=
dmi_vic(vendor_if_vic))
>                        frame->video_code =3D 0;
>        }
>
> @@ -5125,7 +5213,8 @@ drm_hdmi_vendor_infoframe_from_display_mode(struct =
hdmi_vendor_infoframe *frame,
>        if (!has_hdmi_infoframe)
>                return -EINVAL;
>
> -     vic =3D drm_match_hdmi_mode(mode);
> +     vic =3D is_hdmi2_sink(connector) ?
> +                     drm_match_hdmi_1_4_mode(mode) : drm_match_hdmi_mode=
(mode);
>        s3d_flags =3D mode->flags & DRM_MODE_FLAG_3D_MASK;
>
>        /*
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--
Ville Syrj=E4l=E4
Intel

--_000_DM6PR12MB41378F46947DCC2C46494AC8FC9F0DM6PR12MB4137namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Ville Syrj=E4l=E4 &lt=
;ville.syrjala@linux.intel.com&gt;<br>
<b>Sent:</b> Wednesday, October 2, 2019 19:58<br>
<b>To:</b> Lin, Wayne &lt;Wayne.Lin@amd.com&gt;<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt=
;; Li, Sun peng (Leo) &lt;Sunpeng.Li@amd.com&gt;; Kazlauskas, Nicholas &lt;=
Nicholas.Kazlauskas@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/drm_edid: correct VIC and HDMI_VIC under HD=
MI 2.0</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Tue, Sep 24, 2019 at 01:26:21PM &#43;0800, Wayn=
e Lin wrote:<br>
&gt; In HDMI 1.4 defines 4k modes without specific aspect ratio.<br>
&gt; However, in HDMI 2.0, adds aspect ratio attribute to distinguish diffe=
rent<br>
&gt; 4k modes.<br>
&gt; <br>
&gt; According to Appendix E of HDMI 2.0 spec, source should use VSIF to<br=
>
&gt; indicate VIC mode only when the mode is one defined in HDMI 1.4b 4K mo=
des.<br>
&gt; Otherwise, use AVI infoframes to convey VIC.<br>
&gt; <br>
&gt; eg: VIC_103 should use AVI infoframes and VIC_93 use VSIF<br>
&gt; <br>
&gt; When the sink is HDMI 2.0, current code in<br>
&gt; drm_hdmi_avi_infoframe_from_display_mode will also force mode VIC_103 =
to<br>
&gt; have VIC value 0. This violates the spec and needs to be corrected.<br=
>
<br>
&gt; Where is that being done? We only set the AVI VIC to zero if we're goi=
ng<br>
&gt; to use the HDMI VIC instead.</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Appreciate for your time and apologize for not exp=
laining it clearly.&nbsp;</div>
<div class=3D"PlainText">Current code in drm_hdmi_avi_infoframe_from_displa=
y_mode() will call&nbsp;</div>
<div class=3D"PlainText">drm_match_hdmi_mode() to set up&nbsp;vendor_if_vic=
. By checking&nbsp;</div>
<div class=3D"PlainText">drm_valid_hdmi_vic(vendor_if_vic) to see if the vi=
c info should be conveyed by avi</div>
<div class=3D"PlainText">or not.</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">But in&nbsp;drm_match_hdmi_mode(), code doesn't en=
able&nbsp;match_flags with&nbsp;</div>
<div class=3D"PlainText">DRM_MODE_MATCH_ASPECT_RATIO. I think it's due to H=
DMI1.4b doesn't specify</div>
<div class=3D"PlainText">4K mode conveyed by HDMI VIC with particular aspec=
t ratio. But in&nbsp;<span style=3D"font-family: &quot;Segoe UI&quot;, &quo=
t;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, =
BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;">Append=
ix E of&nbsp;</span></div>
<div class=3D"PlainText"><span style=3D"font-family: &quot;Segoe UI&quot;, =
&quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-syst=
em, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;">HD=
MI 2.0 spec, it specify only 4k modes with particular aspect ratio should u=
se
 VSIF to convey.</span></div>
<div class=3D"PlainText">Hence, when the sink support HDMI 2.0 and set the =
mode to be VIC_103, calling</div>
<div class=3D"PlainText">drm_match_hdmi_mode(mode) will return <span style=
=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&q=
uot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quo=
t;Helvetica Neue&quot;, sans-serif; background-color: rgb(255, 255, 255); d=
isplay: inline !important">
vendor_if_vic =3D</span> 3 (VIC_93 and VIC_103 are having</div>
<div class=3D"PlainText">the same timing but different aspect ratio). There=
after will set the&nbsp; frame-&gt;video_code to 0.&nbsp;</div>
<div class=3D"PlainText">However, VIC_103 should use AVI VIC according to H=
DMI 2.0 spec (only VIC: 93, 94, 95 &amp;</div>
<div class=3D"PlainText">98 should use VSIF).</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">This patch try to revise that, when the sink suppo=
rt HDMI 2.0,&nbsp;<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;S=
egoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, Bli=
nkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; background=
-color: rgb(255, 255, 255); display: inline !important">drm_match_hdmi_mode=
()</span></div>
<div class=3D"PlainText"><span style=3D"font-family: &quot;Segoe UI&quot;, =
&quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-syst=
em, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; bac=
kground-color: rgb(255, 255, 255); display: inline !important">should also =
take
 aspect ratio&nbsp;</span><span style=3D"font-family: &quot;Segoe UI&quot;,=
 &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-sys=
tem, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;">i=
nto consideration.&nbsp;</span></div>
<div class=3D"PlainText"><span style=3D"font-family: &quot;Segoe UI&quot;, =
&quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-syst=
em, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;">Bu=
t for easy reading, I add another function &quot;</span><span style=3D"font=
-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &q=
uot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvet=
ica Neue&quot;, sans-serif;">drm_match_hdmi_1_4_mode</span><span style=3D"f=
ont-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;,=
 &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Hel=
vetica Neue&quot;, sans-serif;">&quot;
 to do so.</span></div>
<div class=3D"PlainText"><br>
&gt; The same situation occurs in drm_hdmi_vendor_infoframe_from_display_mo=
de<br>
&gt; and should set HDMI_VIC when the mode is one defined in HDMI 1.4b 4K<b=
r>
&gt; modes.<br>
<br>
&gt; Yes, and we do that. &quot;vic =3D drm_match_hdmi_mode(mode);&quot;<br=
>
<br>
&gt; Apart from adding the aspect ratios I don't really understand what<br>
&gt; you're trying to achieve here.</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">For HDMI 2.0 sink,&nbsp;<span style=3D"font-family=
: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Seg=
oe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neu=
e&quot;, sans-serif; background-color: rgb(255, 255, 255); display: inline =
!important">drm_match_hdmi_mode()
 should also take aspect ratio into consideration.</span></div>
<div class=3D"PlainText"><span style=3D"font-family: &quot;Segoe UI&quot;, =
&quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-syst=
em, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; bac=
kground-color: rgb(255, 255, 255); display: inline !important">Once again, =
very
 appreciate for your time.</span></div>
<div class=3D"PlainText"><br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/drm_edid.c | 95 &#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--=
<br>
&gt;&nbsp; 1 file changed, 92 insertions(&#43;), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c<b=
r>
&gt; index 649cfd8b4200..0fea9bf4ec67 100644<br>
&gt; --- a/drivers/gpu/drm/drm_edid.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/drm_edid.c<br>
&gt; @@ -1306,6 &#43;1306,37 @@ static const struct drm_display_mode edid_4=
k_modes[] =3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vrefresh =3D 24=
, },<br>
&gt;&nbsp; };<br>
&gt;&nbsp; <br>
&gt; &#43;/*<br>
&gt; &#43; * 4k modes of HDMI 1.4 defined in HDMI 2.0. Index using the VIC.=
<br>
&gt; &#43; */<br>
&gt; &#43;static const struct drm_display_mode hdmi_1_4_edid_4k_modes[] =3D=
 {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* 0 - dummy, VICs start at 1 */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; { },<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* 1 - 3840x2160@30Hz */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; { DRM_MODE(&quot;3840x2160&quot;, DRM_MO=
DE_TYPE_DRIVER, 297000,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 3840, 4016, 4104, 4400, 0,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 2160, 2168, 2178, 2250, 0,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vrefresh =3D 30, .picture_a=
spect_ratio =3D HDMI_PICTURE_ASPECT_16_9, },<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* 2 - 3840x2160@25Hz */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; { DRM_MODE(&quot;3840x2160&quot;, DRM_MO=
DE_TYPE_DRIVER, 297000,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 3840, 4896, 4984, 5280, 0,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 2160, 2168, 2178, 2250, 0,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vrefresh =3D 25, .picture_a=
spect_ratio =3D HDMI_PICTURE_ASPECT_16_9, },<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* 3 - 3840x2160@24Hz */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; { DRM_MODE(&quot;3840x2160&quot;, DRM_MO=
DE_TYPE_DRIVER, 297000,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 3840, 5116, 5204, 5500, 0,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 2160, 2168, 2178, 2250, 0,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vrefresh =3D 24, .picture_a=
spect_ratio =3D HDMI_PICTURE_ASPECT_16_9, },<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* 4 - 4096x2160@24Hz (SMPTE) */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; { DRM_MODE(&quot;4096x2160&quot;, DRM_MO=
DE_TYPE_DRIVER, 297000,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 4096, 5116, 5204, 5500, 0,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 2160, 2168, 2178, 2250, 0,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vrefresh =3D 24, .picture_a=
spect_ratio =3D HDMI_PICTURE_ASPECT_256_135, },<br>
&gt; &#43;};<br>
&gt;&nbsp; /*** DDC fetch and block validation ***/<br>
&gt;&nbsp; <br>
&gt;&nbsp; static const u8 edid_header[] =3D {<br>
&gt; @@ -3061,6 &#43;3092,19 @@ hdmi_mode_alternate_clock(const struct drm_=
display_mode *hdmi_mode)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cea_mode_alternate_cl=
ock(hdmi_mode);<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; &#43;/*<br>
&gt; &#43; * Calculate the alternate clock for HDMI modes (those from the H=
DMI vendor<br>
&gt; &#43; * specific block).<br>
&gt; &#43; *<br>
&gt; &#43; * It's almost like hdmi_mode_alternate_clock(), but no exception=
 for VIC 4 mode.<br>
&gt; &#43; * There is an alternate clock (23.98Hz) of VIC 4 mode (4096x2160=
@24Hz) in HDMI 2.0<br>
&gt; &#43; */<br>
&gt; &#43;static unsigned int<br>
&gt; &#43;hdmi_1_4_mode_alternate_clock(const struct drm_display_mode *hdmi=
_mode)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return cea_mode_alternate_clock(hdmi_mod=
e);<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp; static u8 drm_match_hdmi_mode_clock_tolerance(const struct drm_d=
isplay_mode *to_match,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int clock_tolera=
nce)<br>
&gt;&nbsp; {<br>
&gt; @@ -3121,11 &#43;3165,53 @@ static u8 drm_match_hdmi_mode(const struct=
 drm_display_mode *to_match)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; &#43;/*<br>
&gt; &#43; * drm_match_hdmi_1_4_mode - look for a HDMI 1.4 mode matching gi=
ven mode<br>
&gt; &#43; * @to_match: display mode<br>
&gt; &#43; *<br>
&gt; &#43; * An HDMI mode is one defined in the HDMI vendor specific block.=
<br>
&gt; &#43; * In HDMI 2.0, only few 4k resolutions with specific aspect rati=
o should<br>
&gt; &#43; * utilize H14b VSIF.<br>
&gt; &#43; *<br>
&gt; &#43; * Returns the HDMI Video ID (VIC) of the mode or 0 if it isn't o=
ne.<br>
&gt; &#43; */<br>
&gt; &#43;static u8 drm_match_hdmi_1_4_mode(const struct drm_display_mode *=
to_match)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int match_flags =3D DRM_MODE_MA=
TCH_TIMINGS | DRM_MODE_MATCH_FLAGS;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u8 vic;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!to_match-&gt;clock)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return 0;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (to_match-&gt;picture_aspect_ratio)<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; match_flags |=3D DRM_MODE_MATCH_ASPECT_RATIO;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (vic =3D 1; vic &lt; ARRAY_SIZE(hdmi=
_1_4_edid_4k_modes); vic&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; const struct drm_display_mode *hdmi_1_4_mode =3D &amp;hdmi_1_4_edid=
_4k_modes[vic];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; unsigned int clock1, clock2;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Make sure to also match alternate clocks */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; clock1 =3D hdmi_1_4_mode-&gt;clock;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; clock2 =3D hdmi_1_4_mode_alternate_clock(hdmi_1_4_mode);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if ((KHZ2PICOS(to_match-&gt;clock) =3D=3D KHZ2PICOS(clock1) ||<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; KHZ2PICOS(to_match-&gt;clock) =3D=3D =
KHZ2PICOS(clock2)) &amp;&amp;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_mode_match(to_match, hdmi_1_4_mode, mat=
ch_flags))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return vic;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp; static bool drm_valid_hdmi_vic(u8 vic)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return vic &gt; 0 &amp;&amp;=
 vic &lt; ARRAY_SIZE(edid_4k_modes);<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; &#43;static bool drm_valid_hdmi_1_4_vic(u8 vic)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return vic &gt; 0 &amp;&amp; vic &lt; AR=
RAY_SIZE(hdmi_1_4_edid_4k_modes);<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp; static int<br>
&gt;&nbsp; add_alternate_cea_modes(struct drm_connector *connector, struct =
edid *edid)<br>
&gt;&nbsp; {<br>
&gt; @@ -4894,10 &#43;4980,12 @@ drm_hdmi_avi_infoframe_from_display_mode(s=
truct hdmi_avi_infoframe *frame,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * HDMI 1.4b 4K modes<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (frame-&gt;video_code) {<=
br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; u8 vendor_if_vic =3D drm_match_hdmi_mode(mode);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; u8 vendor_if_vic =3D is_hdmi2_sink(connector) ?<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_match_hdmi_1_4_=
mode(mode) : drm_match_hdmi_mode(mode);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; bool is_s3d =3D mode-&gt;flags &amp; DRM_MODE_FLAG_3D_M=
ASK;<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (drm_valid_hdmi_vic(vendor_if_vic) &amp;&amp; !is_s3d)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (!is_s3d &amp;&amp; is_hdmi2_sink(connector) ?<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_valid_hdmi_1_4_=
vic(vendor_if_vic) : drm_valid_hdmi_vic(vendor_if_vic))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; frame-&=
gt;video_code =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; @@ -5125,7 &#43;5213,8 @@ drm_hdmi_vendor_infoframe_from_display_mode(=
struct hdmi_vendor_infoframe *frame,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!has_hdmi_infoframe)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; vic =3D drm_match_hdmi_mode(mode);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vic =3D is_hdmi2_sink(connector) ?<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_match_hdmi_1_4_=
mode(mode) : drm_match_hdmi_mode(mode);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s3d_flags =3D mode-&gt;flags=
 &amp; DRM_MODE_FLAG_3D_MASK;<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; dri-devel@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel">h=
ttps://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
<br>
-- <br>
Ville Syrj=E4l=E4<br>
Intel<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR12MB41378F46947DCC2C46494AC8FC9F0DM6PR12MB4137namp_--

--===============1658414142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1658414142==--
