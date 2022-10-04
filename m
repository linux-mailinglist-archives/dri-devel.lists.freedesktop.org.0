Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A51895F3AFA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 03:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC3D10E51A;
	Tue,  4 Oct 2022 01:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2C610E51A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 01:22:25 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id e20so7275749qts.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 18:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kh5fnJcdBuc3Zxwu7Y0vt+E0WGXdqAWNlfZrZBd4A+Y=;
 b=XNWWahYdJHMbd+vxjdQShRQVBCGs5/SaBP4y6aIg6PxuiIc3AhMIhlVh3CZjITBYko
 HdiTIc1WV4dVSqYFM4FAgny/c2mEN121eegvTIVJ8ZQUlv7E2d4tl8sUxR3+ygUyn2cJ
 rmGMfWUGePItQ+l9T5MJ70WrFhUqB6I4DJBjV+WYFFVkpJNXNm53K5ETUjj8YzhC2s5j
 MtJAU49PZ+eg0vuPJzmtR6HbplKuqJEu2VLWeqXGyA6BzHCX7Ztv42VYuW3GHIVFj+IG
 tvrJysrdhYCh/T4xv1n4y4BDpkrQhJpv4nsdSN2a8j2ObLTfXVoVHNf77xi8/fRUNabr
 q7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kh5fnJcdBuc3Zxwu7Y0vt+E0WGXdqAWNlfZrZBd4A+Y=;
 b=EcKTnfsBhu6/ZgnI1Fz659cONnLAs37My6hNUziJ2KIkJLT20rbRrhdzF7IyWOReB7
 9JLweuNPir89Xtiu3n7wfnzBDW8b8So5yFiOgIY34xVuh02//iIqDMUMyjiiXuWDTf6e
 HsdYLe6TT/y/M2vM64Yv1K5FS/uozpx9dkiIsavPKHva3fqVuqW2TrVMgKwr5AnCcz0k
 x3SPEiTY3wJHJJPKbFqiutKWpErrkXFp9N1fi6jAY/aitUCwJ1Dnfd8LdzoqCFqMI+hh
 v/KCqkrOxXJHfsmFshXujuGmolTKbST9eO9aDhaUp4yBge0fWN8oMo5+COQmpUVaRaaG
 PCKw==
X-Gm-Message-State: ACrzQf1qJjJgrDB3f+cgrQ+k4IAK8b/AgKfJsRCnV2qns+tQmJBSnaSI
 Vnyxi+hU03yqzmKw0HlOTIsDlj/Dl2JAb8O71bE=
X-Google-Smtp-Source: AMsMyM6ktqO2vdxR2Pdq7X656zJXDPRsRllX46TGYNwuBPQN49G4ar/ZBNM7sYRmIUdlhhd0Q7Zarph7atFl7aGUg08=
X-Received: by 2002:ac8:7f0a:0:b0:35c:e943:cde7 with SMTP id
 f10-20020ac87f0a000000b0035ce943cde7mr18028218qtk.158.1664846543980; Mon, 03
 Oct 2022 18:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220916135014.2873-1-ruinairas1992@gmail.com>
In-Reply-To: <20220916135014.2873-1-ruinairas1992@gmail.com>
From: Matthew Anderson <ruinairas1992@gmail.com>
Date: Mon, 3 Oct 2022 20:22:15 -0500
Message-ID: <CAEnG5GDv4q2E__xCkt7xT=4EM=007qs7-AJ-JQDcdYbcWUnGuA@mail.gmail.com>
Subject: Re: [PATCH] Updated the orientation quirks to support the many
 variations of ONEXPLAYER and AokZoe devices.
To: maarten.lankhorst@linux.intel.com
Content-Type: multipart/alternative; boundary="000000000000dc0c1e05ea2b4ad6"
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000dc0c1e05ea2b4ad6
Content-Type: text/plain; charset="UTF-8"

Has anyone been able to review this? If possible I'd like to see this
pulled into 6.1

On Fri, Sep 16, 2022, 8:50 AM Matthew <ruinairas1992@gmail.com> wrote:

> Signed-off-by: Matthew Anderson <ruinairas1992@gmail.com>
> ---
>  .../gpu/drm/drm_panel_orientation_quirks.c    | 86 ++++++++++++++++++-
>  1 file changed, 85 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index fc1728d46ac2..15203c134717 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -115,6 +115,18 @@ static const struct drm_dmi_panel_orientation_data
> lcd1280x1920_rightside_up = {
>         .orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>  };
>
> +static const struct drm_dmi_panel_orientation_data
> lcd800x1280_leftside_up = {
> +       .width = 800,
> +       .height = 1280,
> +       .orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
> +};
> +
> +static const struct drm_dmi_panel_orientation_data
> lcd1200x1920_leftside_up = {
> +       .width = 1200,
> +       .height = 1920,
> +       .orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
> +};
> +
>  static const struct drm_dmi_panel_orientation_data
> lcd1600x2560_leftside_up = {
>         .width = 1600,
>         .height = 2560,
> @@ -128,6 +140,12 @@ static const struct dmi_system_id orientation_data[]
> = {
>                   DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "One S1003"),
>                 },
>                 .driver_data = (void *)&lcd800x1280_rightside_up,
> +       }, {    /* AOKZOE A1 AR07 */
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AOKZOE"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AOKZOE A1 AR07"),
> +               },
> +               .driver_data = (void *)&lcd1200x1920_leftside_up,
>         }, {    /* Asus T100HA */
>                 .matches = {
>                   DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> @@ -308,12 +326,78 @@ static const struct dmi_system_id orientation_data[]
> = {
>                   DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Default string"),
>                 },
>                 .driver_data = (void *)&onegx1_pro,
> -       }, {    /* OneXPlayer */
> +       }, {    /* OneXPlayer 800P Original DMI Values */
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY
> CO., LTD."),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
> +               },
> +               .driver_data = (void *)&lcd800x1280_leftside_up,
> +       }, {    /* OneXPlayer 1200P Original DMI Values */
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY
> CO., LTD."),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
> +               },
> +               .driver_data = (void *)&lcd1200x1920_leftside_up,
> +       }, {    /* OneXPlayer 1600P Original DMI Values */
>                 .matches = {
>                   DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY
> CO., LTD."),
>                   DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
>                 },
>                 .driver_data = (void *)&lcd1600x2560_leftside_up,
> +       }, {    /* OneXPlayer Gundam Edition Bios Updated */
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER GUNDAM
> GA72"),
> +               },
> +               .driver_data = (void *)&lcd1200x1920_leftside_up,
> +       }, {    /* ONEXPLAYER mini A07 800P Bios Updated */
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER mini A07"),
> +               },
> +               .driver_data = (void *)&lcd800x1280_leftside_up,
> +       }, {    /* ONEXPLAYER mini A07 1200P Bios Updated*/
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER mini A07"),
> +               },
> +               .driver_data = (void *)&lcd1200x1920_leftside_up,
> +       }, {    /* ONEXPLAYER mini GA72 800P Bios Updated*/
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER mini
> GA72"),
> +               },
> +               .driver_data = (void *)&lcd800x1280_leftside_up,
> +       }, {    /* ONEXPLAYER mini GA72 1200P Bios Updated*/
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER mini
> GA72"),
> +               },
> +               .driver_data = (void *)&lcd1200x1920_leftside_up,
> +       }, {    /* ONEXPLAYER mini GT72 800P Bios Updated*/
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER mini
> GT72"),
> +               },
> +               .driver_data = (void *)&lcd800x1280_leftside_up,
> +       }, {    /* ONEXPLAYER mini GT72 1200P Bios Updated*/
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER mini
> GT72"),
> +               },
> +               .driver_data = (void *)&lcd1200x1920_leftside_up,
> +       }, {    /* OneXPlayer 1 8.4" Intel Bios Updated */
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER 1 T08"),
> +               },
> +               .driver_data = (void *)&lcd1600x2560_leftside_up,
> +       }, {    /* OneXPlayer 1S 8.4" Intel Bios Updated */
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER 1S T08"),
> +               },
> +               .driver_data = (void *)&lcd1600x2560_leftside_up,
>         }, {    /* Samsung GalaxyBook 10.6 */
>                 .matches = {
>                   DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS
> CO., LTD."),
> --
> 2.37.3
>
>

--000000000000dc0c1e05ea2b4ad6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9ImF1dG8iPkhhcyBhbnlvbmUgYmVlbiBhYmxlIHRvIHJldmlldyB0aGlzPyBJZiBw
b3NzaWJsZSBJJiMzOTtkIGxpa2UgdG8gc2VlIHRoaXMgcHVsbGVkIGludG8gNi4xPC9kaXY+PGJy
PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0
ciI+T24gRnJpLCBTZXAgMTYsIDIwMjIsIDg6NTAgQU0gTWF0dGhldyAmbHQ7PGEgaHJlZj0ibWFp
bHRvOnJ1aW5haXJhczE5OTJAZ21haWwuY29tIj5ydWluYWlyYXMxOTkyQGdtYWlsLmNvbTwvYT4m
Z3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxl
PSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxl
ZnQ6MWV4Ij5TaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEFuZGVyc29uICZsdDs8YSBocmVmPSJtYWls
dG86cnVpbmFpcmFzMTk5MkBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJy
ZXIiPnJ1aW5haXJhczE5OTJAZ21haWwuY29tPC9hPiZndDs8YnI+DQotLS08YnI+DQrCoC4uLi9n
cHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3MuY8KgIMKgIHwgODYgKysrKysrKysr
KysrKysrKysrLTxicj4NCsKgMSBmaWxlIGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSk8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5l
bF9vcmllbnRhdGlvbl9xdWlya3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50
YXRpb25fcXVpcmtzLmM8YnI+DQppbmRleCBmYzE3MjhkNDZhYzIuLjE1MjAzYzEzNDcxNyAxMDA2
NDQ8YnI+DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJr
cy5jPGJyPg0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWly
a3MuYzxicj4NCkBAIC0xMTUsNiArMTE1LDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rt
aV9wYW5lbF9vcmllbnRhdGlvbl9kYXRhIGxjZDEyODB4MTkyMF9yaWdodHNpZGVfdXAgPSB7PGJy
Pg0KwqAgwqAgwqAgwqAgLm9yaWVudGF0aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05f
UklHSFRfVVAsPGJyPg0KwqB9Ozxicj4NCjxicj4NCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9k
bWlfcGFuZWxfb3JpZW50YXRpb25fZGF0YSBsY2Q4MDB4MTI4MF9sZWZ0c2lkZV91cCA9IHs8YnI+
DQorwqAgwqAgwqAgwqAud2lkdGggPSA4MDAsPGJyPg0KK8KgIMKgIMKgIMKgLmhlaWdodCA9IDEy
ODAsPGJyPg0KK8KgIMKgIMKgIMKgLm9yaWVudGF0aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5U
QVRJT05fTEVGVF9VUCw8YnI+DQorfTs8YnI+DQorPGJyPg0KK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX2RtaV9wYW5lbF9vcmllbnRhdGlvbl9kYXRhIGxjZDEyMDB4MTkyMF9sZWZ0c2lkZV91cCA9
IHs8YnI+DQorwqAgwqAgwqAgwqAud2lkdGggPSAxMjAwLDxicj4NCivCoCDCoCDCoCDCoC5oZWln
aHQgPSAxOTIwLDxicj4NCivCoCDCoCDCoCDCoC5vcmllbnRhdGlvbiA9IERSTV9NT0RFX1BBTkVM
X09SSUVOVEFUSU9OX0xFRlRfVVAsPGJyPg0KK307PGJyPg0KKzxicj4NCsKgc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fZG1pX3BhbmVsX29yaWVudGF0aW9uX2RhdGEgbGNkMTYwMHgyNTYwX2xlZnRz
aWRlX3VwID0gezxicj4NCsKgIMKgIMKgIMKgIC53aWR0aCA9IDE2MDAsPGJyPg0KwqAgwqAgwqAg
wqAgLmhlaWdodCA9IDI1NjAsPGJyPg0KQEAgLTEyOCw2ICsxNDAsMTIgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkbWlfc3lzdGVtX2lkIG9yaWVudGF0aW9uX2RhdGFbXSA9IHs8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgJnF1
b3Q7T25lIFMxMDAzJnF1b3Q7KSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9LDxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5kcml2ZXJfZGF0YSA9ICh2b2lkICopJmFtcDtsY2Q4
MDB4MTI4MF9yaWdodHNpZGVfdXAsPGJyPg0KK8KgIMKgIMKgIMKgfSwge8KgIMKgIC8qIEFPS1pP
RSBBMSBBUjA3ICovPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1hdGNoZXMgPSB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgRE1JX0VYQUNUX01BVENIKERNSV9TWVNfVkVO
RE9SLCAmcXVvdDtBT0taT0UmcXVvdDspLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAmcXVvdDtBT0taT0UgQTEgQVIwNyZx
dW90OyksPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfSw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZhbXA7bGNkMTIwMHgxOTIwX2xlZnRz
aWRlX3VwLDxicj4NCsKgIMKgIMKgIMKgIH0sIHvCoCDCoCAvKiBBc3VzIFQxMDBIQSAqLzxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5tYXRjaGVzID0gezxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIERNSV9FWEFDVF9NQVRDSChETUlfU1lTX1ZFTkRPUiwgJnF1b3Q7QVNVU1Rl
SyBDT01QVVRFUiBJTkMuJnF1b3Q7KSw8YnI+DQpAQCAtMzA4LDEyICszMjYsNzggQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIG9yaWVudGF0aW9uX2RhdGFbXSA9IHs8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfVkVS
U0lPTiwgJnF1b3Q7RGVmYXVsdCBzdHJpbmcmcXVvdDspLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIH0sPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLmRyaXZlcl9kYXRhID0gKHZv
aWQgKikmYW1wO29uZWd4MV9wcm8sPGJyPg0KLcKgIMKgIMKgIMKgfSwge8KgIMKgIC8qIE9uZVhQ
bGF5ZXIgKi88YnI+DQorwqAgwqAgwqAgwqB9LCB7wqAgwqAgLyogT25lWFBsYXllciA4MDBQIE9y
aWdpbmFsIERNSSBWYWx1ZXMgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubWF0Y2hl
cyA9IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBETUlfRVhBQ1RfTUFUQ0goRE1J
X1NZU19WRU5ET1IsICZxdW90O09ORS1ORVRCT09LIFRFQ0hOT0xPR1kgQ08uLCBMVEQuJnF1b3Q7
KSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBETUlfRVhBQ1RfTUFUQ0goRE1JX1BS
T0RVQ1RfTkFNRSwgJnF1b3Q7T05FIFhQTEFZRVImcXVvdDspLDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoH0sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmRyaXZlcl9kYXRhID0g
KHZvaWQgKikmYW1wO2xjZDgwMHgxMjgwX2xlZnRzaWRlX3VwLDxicj4NCivCoCDCoCDCoCDCoH0s
IHvCoCDCoCAvKiBPbmVYUGxheWVyIDEyMDBQIE9yaWdpbmFsIERNSSBWYWx1ZXMgKi88YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubWF0Y2hlcyA9IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBETUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICZxdW90O09ORS1ORVRC
T09LIFRFQ0hOT0xPR1kgQ08uLCBMVEQuJnF1b3Q7KSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgJnF1b3Q7T05FIFhQTEFZ
RVImcXVvdDspLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0sPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgLmRyaXZlcl9kYXRhID0gKHZvaWQgKikmYW1wO2xjZDEyMDB4MTkyMF9s
ZWZ0c2lkZV91cCw8YnI+DQorwqAgwqAgwqAgwqB9LCB7wqAgwqAgLyogT25lWFBsYXllciAxNjAw
UCBPcmlnaW5hbCBETUkgVmFsdWVzICovPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLm1h
dGNoZXMgPSB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgRE1JX0VYQUNUX01BVENI
KERNSV9TWVNfVkVORE9SLCAmcXVvdDtPTkUtTkVUQk9PSyBURUNITk9MT0dZIENPLiwgTFRELiZx
dW90OyksPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgRE1JX0VYQUNUX01BVENIKERN
SV9QUk9EVUNUX05BTUUsICZxdW90O09ORSBYUExBWUVSJnF1b3Q7KSw8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB9LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5kcml2ZXJfZGF0
YSA9ICh2b2lkICopJmFtcDtsY2QxNjAweDI1NjBfbGVmdHNpZGVfdXAsPGJyPg0KK8KgIMKgIMKg
IMKgfSwge8KgIMKgIC8qIE9uZVhQbGF5ZXIgR3VuZGFtIEVkaXRpb24gQmlvcyBVcGRhdGVkICov
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1hdGNoZXMgPSB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgRE1JX0VYQUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAmcXVvdDtP
TkUtTkVUQk9PSyZxdW90OyksPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgRE1JX0VY
QUNUX01BVENIKERNSV9QUk9EVUNUX05BTUUsICZxdW90O09ORVhQTEFZRVIgR1VOREFNIEdBNzIm
cXVvdDspLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0sPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgLmRyaXZlcl9kYXRhID0gKHZvaWQgKikmYW1wO2xjZDEyMDB4MTkyMF9sZWZ0
c2lkZV91cCw8YnI+DQorwqAgwqAgwqAgwqB9LCB7wqAgwqAgLyogT05FWFBMQVlFUiBtaW5pIEEw
NyA4MDBQIEJpb3MgVXBkYXRlZCAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5tYXRj
aGVzID0gezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoERNSV9FWEFDVF9NQVRDSChE
TUlfU1lTX1ZFTkRPUiwgJnF1b3Q7T05FLU5FVEJPT0smcXVvdDspLDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAmcXVvdDtP
TkVYUExBWUVSIG1pbmkgQTA3JnF1b3Q7KSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5kcml2ZXJfZGF0YSA9ICh2b2lkICopJmFt
cDtsY2Q4MDB4MTI4MF9sZWZ0c2lkZV91cCw8YnI+DQorwqAgwqAgwqAgwqB9LCB7wqAgwqAgLyog
T05FWFBMQVlFUiBtaW5pIEEwNyAxMjAwUCBCaW9zIFVwZGF0ZWQqLzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoC5tYXRjaGVzID0gezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oERNSV9FWEFDVF9NQVRDSChETUlfU1lTX1ZFTkRPUiwgJnF1b3Q7T05FLU5FVEJPT0smcXVvdDsp
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoERNSV9FWEFDVF9NQVRDSChETUlfUFJP
RFVDVF9OQU1FLCAmcXVvdDtPTkVYUExBWUVSIG1pbmkgQTA3JnF1b3Q7KSw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB9LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5kcml2ZXJf
ZGF0YSA9ICh2b2lkICopJmFtcDtsY2QxMjAweDE5MjBfbGVmdHNpZGVfdXAsPGJyPg0KK8KgIMKg
IMKgIMKgfSwge8KgIMKgIC8qIE9ORVhQTEFZRVIgbWluaSBHQTcyIDgwMFAgQmlvcyBVcGRhdGVk
Ki88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubWF0Y2hlcyA9IHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBETUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICZxdW90
O09ORS1ORVRCT09LJnF1b3Q7KSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBETUlf
RVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgJnF1b3Q7T05FWFBMQVlFUiBtaW5pIEdBNzIm
cXVvdDspLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0sPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgLmRyaXZlcl9kYXRhID0gKHZvaWQgKikmYW1wO2xjZDgwMHgxMjgwX2xlZnRz
aWRlX3VwLDxicj4NCivCoCDCoCDCoCDCoH0sIHvCoCDCoCAvKiBPTkVYUExBWUVSIG1pbmkgR0E3
MiAxMjAwUCBCaW9zIFVwZGF0ZWQqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5tYXRj
aGVzID0gezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoERNSV9FWEFDVF9NQVRDSChE
TUlfU1lTX1ZFTkRPUiwgJnF1b3Q7T05FLU5FVEJPT0smcXVvdDspLDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAmcXVvdDtP
TkVYUExBWUVSIG1pbmkgR0E3MiZxdW90OyksPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZh
bXA7bGNkMTIwMHgxOTIwX2xlZnRzaWRlX3VwLDxicj4NCivCoCDCoCDCoCDCoH0sIHvCoCDCoCAv
KiBPTkVYUExBWUVSIG1pbmkgR1Q3MiA4MDBQIEJpb3MgVXBkYXRlZCovPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgLm1hdGNoZXMgPSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgRE1JX0VYQUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAmcXVvdDtPTkUtTkVUQk9PSyZxdW90
OyksPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgRE1JX0VYQUNUX01BVENIKERNSV9Q
Uk9EVUNUX05BTUUsICZxdW90O09ORVhQTEFZRVIgbWluaSBHVDcyJnF1b3Q7KSw8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5kcml2
ZXJfZGF0YSA9ICh2b2lkICopJmFtcDtsY2Q4MDB4MTI4MF9sZWZ0c2lkZV91cCw8YnI+DQorwqAg
wqAgwqAgwqB9LCB7wqAgwqAgLyogT05FWFBMQVlFUiBtaW5pIEdUNzIgMTIwMFAgQmlvcyBVcGRh
dGVkKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubWF0Y2hlcyA9IHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBETUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICZx
dW90O09ORS1ORVRCT09LJnF1b3Q7KSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBE
TUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgJnF1b3Q7T05FWFBMQVlFUiBtaW5pIEdU
NzImcXVvdDspLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0sPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgLmRyaXZlcl9kYXRhID0gKHZvaWQgKikmYW1wO2xjZDEyMDB4MTkyMF9s
ZWZ0c2lkZV91cCw8YnI+DQorwqAgwqAgwqAgwqB9LCB7wqAgwqAgLyogT25lWFBsYXllciAxIDgu
NCZxdW90OyBJbnRlbCBCaW9zIFVwZGF0ZWQgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAubWF0Y2hlcyA9IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBETUlfRVhBQ1Rf
TUFUQ0goRE1JX1NZU19WRU5ET1IsICZxdW90O09ORS1ORVRCT09LJnF1b3Q7KSw8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwg
JnF1b3Q7T05FWFBMQVlFUiAxIFQwOCZxdW90OyksPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuZHJpdmVyX2RhdGEgPSAodm9pZCAq
KSZhbXA7bGNkMTYwMHgyNTYwX2xlZnRzaWRlX3VwLDxicj4NCivCoCDCoCDCoCDCoH0sIHvCoCDC
oCAvKiBPbmVYUGxheWVyIDFTIDguNCZxdW90OyBJbnRlbCBCaW9zIFVwZGF0ZWQgKi88YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubWF0Y2hlcyA9IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBETUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICZxdW90O09ORS1ORVRC
T09LJnF1b3Q7KSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBETUlfRVhBQ1RfTUFU
Q0goRE1JX1BST0RVQ1RfTkFNRSwgJnF1b3Q7T05FWFBMQVlFUiAxUyBUMDgmcXVvdDspLDxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
LmRyaXZlcl9kYXRhID0gKHZvaWQgKikmYW1wO2xjZDE2MDB4MjU2MF9sZWZ0c2lkZV91cCw8YnI+
DQrCoCDCoCDCoCDCoCB9LCB7wqAgwqAgLyogU2Ftc3VuZyBHYWxheHlCb29rIDEwLjYgKi88YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAubWF0Y2hlcyA9IHs8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBETUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICZxdW90O1NBTVNV
TkcgRUxFQ1RST05JQ1MgQ08uLCBMVEQuJnF1b3Q7KSw8YnI+DQotLSA8YnI+DQoyLjM3LjM8YnI+
DQo8YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+DQo=
--000000000000dc0c1e05ea2b4ad6--
