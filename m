Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2306D147020
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 18:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7CB6FE0B;
	Thu, 23 Jan 2020 17:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C336FE0B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 17:56:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 303B520051;
 Thu, 23 Jan 2020 18:56:52 +0100 (CET)
Date: Thu, 23 Jan 2020 18:56:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: display: Convert a bunch of panels to DT
 schema
Message-ID: <20200123175650.GA17233@ravnborg.org>
References: <20200119210907.24152-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200119210907.24152-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
 a=zu6OG0ZhAAAA:8 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=TPRVtkqi5Fc6Iiqf4P0A:9 a=rC89UHhl0G51LEBa:21 a=L23jK1ofpvvnDmBU:21
 a=xD850D2NDlvQZnHq:21 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=pAN39diAhXWuPx0-Vjn3:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 19, 2020 at 03:09:07PM -0600, Rob Herring wrote:
> Convert all the 'simple' panels which match the constraints of the
> common panel-simple.yaml schema. This conversion is based on how the
> panels are documented. Some may turn out to be more complex once the
> schema is applied to actual dts files.
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Rob Herring <robh@kernel.org>

Removing this amount of files does not happen every day - it is a good feeling.
Thanks, applied to drm-misc-next.

	Sam


> ---
> v3:
>  - Drop innolux panel with no-hpd property
>  - Don't remove LG DSI panel bindings whose compatibles were dropped
> 
>  .../bindings/display/panel/auo,b080uan01.txt  |   7 -
>  .../bindings/display/panel/auo,b101aw03.txt   |   7 -
>  .../bindings/display/panel/auo,b101ean01.txt  |   7 -
>  .../bindings/display/panel/auo,b101xtn01.txt  |   7 -
>  .../bindings/display/panel/auo,b116xw03.txt   |   7 -
>  .../bindings/display/panel/auo,b133htn01.txt  |   7 -
>  .../bindings/display/panel/auo,b133xtn01.txt  |   7 -
>  .../bindings/display/panel/auo,g070vvn01.txt  |  29 ---
>  .../bindings/display/panel/auo,g101evn010.txt |  12 --
>  .../bindings/display/panel/auo,g104sn02.txt   |  12 --
>  .../bindings/display/panel/auo,g133han01.txt  |   7 -
>  .../bindings/display/panel/auo,g185han01.txt  |   7 -
>  .../bindings/display/panel/auo,p320hvn03.txt  |   8 -
>  .../bindings/display/panel/auo,t215hvn01.txt  |   7 -
>  .../display/panel/avic,tm070ddh03.txt         |   7 -
>  .../display/panel/boe,hv070wsa-100.txt        |  28 ---
>  .../display/panel/boe,nv101wxmn51.txt         |   7 -
>  .../display/panel/boe,tv080wum-nl0.txt        |   7 -
>  .../display/panel/cdtech,s043wq26h-ct7.txt    |  12 --
>  .../display/panel/cdtech,s070wv95-ct16.txt    |  12 --
>  .../display/panel/chunghwa,claa070wp03xg.txt  |   7 -
>  .../display/panel/chunghwa,claa101wa01a.txt   |   7 -
>  .../display/panel/chunghwa,claa101wb03.txt    |   7 -
>  .../panel/dataimage,scf0700c48ggu18.txt       |   8 -
>  .../bindings/display/panel/dlc,dlc1010gig.txt |  12 --
>  .../bindings/display/panel/edt,et-series.txt  |  55 -----
>  .../display/panel/evervision,vgg804821.txt    |  12 --
>  .../display/panel/foxlink,fl500wvr00-a0t.txt  |   7 -
>  .../display/panel/friendlyarm,hd702e.txt      |  32 ---
>  .../display/panel/giantplus,gpg482739qs5.txt  |   7 -
>  .../display/panel/hannstar,hsd070pww1.txt     |   7 -
>  .../display/panel/hannstar,hsd100pxn1.txt     |   7 -
>  .../display/panel/hit,tx23d38vm0caa.txt       |   7 -
>  .../display/panel/innolux,at043tn24.txt       |   7 -
>  .../display/panel/innolux,at070tn92.txt       |   7 -
>  .../display/panel/innolux,g070y2-l01.txt      |  12 --
>  .../display/panel/innolux,g101ice-l01.txt     |   7 -
>  .../display/panel/innolux,g121i1-l01.txt      |   7 -
>  .../display/panel/innolux,g121x1-l03.txt      |   7 -
>  .../display/panel/innolux,n116bge.txt         |   7 -
>  .../display/panel/innolux,n156bge-l21.txt     |   7 -
>  .../display/panel/innolux,zj070na-01p.txt     |   7 -
>  .../display/panel/koe,tx14d24vm1bpa.txt       |  42 ----
>  .../display/panel/koe,tx31d200vm0baa.txt      |  25 ---
>  .../bindings/display/panel/kyo,tcg121xglp.txt |   7 -
>  .../display/panel/lemaker,bl035-rgb-002.txt   |  12 --
>  .../bindings/display/panel/lg,lb070wv8.txt    |   7 -
>  .../display/panel/lg,lp079qx1-sp0v.txt        |   7 -
>  .../display/panel/lg,lp097qx1-spa1.txt        |   7 -
>  .../bindings/display/panel/lg,lp120up1.txt    |   7 -
>  .../bindings/display/panel/lg,lp129qe.txt     |   7 -
>  .../display/panel/mitsubishi,aa070mc01.txt    |   7 -
>  .../display/panel/nec,nl12880b20-05.txt       |   8 -
>  .../display/panel/nec,nl4827hc19-05b.txt      |   7 -
>  .../display/panel/netron-dy,e231732.txt       |   7 -
>  .../panel/newhaven,nhd-4.3-480272ef-atxl.txt  |   7 -
>  .../display/panel/nlt,nl192108ac18-02d.txt    |   8 -
>  .../bindings/display/panel/nvd,9128.txt       |   7 -
>  .../display/panel/okaya,rs800480t-7x0gp.txt   |   7 -
>  .../panel/olimex,lcd-olinuxino-43-ts.txt      |   7 -
>  .../display/panel/ontat,yx700wv03.txt         |   7 -
>  .../display/panel/ortustech,com37h3m05dtc.txt |  12 --
>  .../display/panel/ortustech,com37h3m99dtc.txt |  12 --
>  .../display/panel/ortustech,com43h4m85ulc.txt |   7 -
>  .../panel/osddisplays,osd070t1718-19ts.txt    |  12 --
>  .../panel/osddisplays,osd101t2045-53ts.txt    |  11 -
>  .../display/panel/panasonic,vvx10f004b00.txt  |   7 -
>  .../bindings/display/panel/panel-simple.yaml  | 195 ++++++++++++++++++
>  .../display/panel/qiaodian,qd43003c0-40.txt   |   7 -
>  .../display/panel/rocktech,rk070er9427.txt    |  25 ---
>  .../display/panel/samsung,lsn122dl01-c01.txt  |   7 -
>  .../display/panel/samsung,ltn101nt05.txt      |   7 -
>  .../display/panel/samsung,ltn140at29-301.txt  |   7 -
>  .../display/panel/sharp,lq035q7db03.txt       |  12 --
>  .../display/panel/sharp,lq070y3dg3b.txt       |  12 --
>  .../display/panel/sharp,lq101k1ly04.txt       |   7 -
>  .../display/panel/sharp,lq123p1jx31.txt       |   7 -
>  .../display/panel/shelly,sca07010-bfn-lnn.txt |   7 -
>  .../display/panel/starry,kr122ea0sra.txt      |   7 -
>  .../display/panel/tianma,tm070jdhg30.txt      |   7 -
>  .../display/panel/tianma,tm070rvhg71.txt      |  29 ---
>  .../display/panel/toshiba,lt089ac29000.txt    |   8 -
>  .../bindings/display/panel/tpk,f07a-0102.txt  |   8 -
>  .../bindings/display/panel/tpk,f10a-0102.txt  |   8 -
>  .../display/panel/urt,umsh-8596md.txt         |  16 --
>  .../display/panel/vl050_8048nt_c01.txt        |  12 --
>  .../display/panel/winstar,wf35ltiacd.txt      |  48 -----
>  MAINTAINERS                                   |   1 -
>  88 files changed, 195 insertions(+), 943 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b080uan01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b101aw03.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b101ean01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b101xtn01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b116xw03.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b133htn01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b133xtn01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g070vvn01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g101evn010.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g133han01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g185han01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,p320hvn03.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,t215hvn01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/avic,tm070ddh03.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,nv101wxmn51.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/chunghwa,claa101wa01a.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/chunghwa,claa101wb03.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/dlc,dlc1010gig.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/edt,et-series.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/evervision,vgg804821.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/foxlink,fl500wvr00-a0t.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/giantplus,gpg482739qs5.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/hannstar,hsd070pww1.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/hannstar,hsd100pxn1.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx23d38vm0caa.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,at043tn24.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,at070tn92.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,g070y2-l01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,g101ice-l01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,g121i1-l01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,g121x1-l03.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,n116bge.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,n156bge-l21.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,zj070na-01p.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lb070wv8.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp079qx1-sp0v.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp120up1.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp129qe.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/netron-dy,e231732.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/newhaven,nhd-4.3-480272ef-atxl.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/nvd,9128.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/okaya,rs800480t-7x0gp.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino-43-ts.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ontat,yx700wv03.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com37h3m05dtc.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com43h4m85ulc.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/osddisplays,osd070t1718-19ts.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2045-53ts.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panasonic,vvx10f004b00.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/qiaodian,qd43003c0-40.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ltn101nt05.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ltn140at29-301.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq035q7db03.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq123p1jx31.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/shelly,sca07010-bfn-lnn.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/tianma,tm070jdhg30.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/vl050_8048nt_c01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,b080uan01.txt b/Documentation/devicetree/bindings/display/panel/auo,b080uan01.txt
> deleted file mode 100644
> index bae0e2b51467..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,b080uan01.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -AU Optronics Corporation 8.0" WUXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,b101ean01"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,b101aw03.txt b/Documentation/devicetree/bindings/display/panel/auo,b101aw03.txt
> deleted file mode 100644
> index 72e088a4fb3a..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,b101aw03.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -AU Optronics Corporation 10.1" WSVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,b101aw03"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,b101ean01.txt b/Documentation/devicetree/bindings/display/panel/auo,b101ean01.txt
> deleted file mode 100644
> index 3590b0741619..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,b101ean01.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -AU Optronics Corporation 10.1" WSVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,b101ean01"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,b101xtn01.txt b/Documentation/devicetree/bindings/display/panel/auo,b101xtn01.txt
> deleted file mode 100644
> index 889d511d66c9..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,b101xtn01.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -AU Optronics Corporation 10.1" WXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,b101xtn01"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,b116xw03.txt b/Documentation/devicetree/bindings/display/panel/auo,b116xw03.txt
> deleted file mode 100644
> index 690d0a568ef3..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,b116xw03.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -AU Optronics Corporation 11.6" HD (1366x768) color TFT-LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,b116xw03"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,b133htn01.txt b/Documentation/devicetree/bindings/display/panel/auo,b133htn01.txt
> deleted file mode 100644
> index 302226b5bb55..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,b133htn01.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,b133htn01"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,b133xtn01.txt b/Documentation/devicetree/bindings/display/panel/auo,b133xtn01.txt
> deleted file mode 100644
> index 7443b7c76769..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,b133xtn01.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -AU Optronics Corporation 13.3" WXGA (1366x768) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,b133xtn01"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,g070vvn01.txt b/Documentation/devicetree/bindings/display/panel/auo,g070vvn01.txt
> deleted file mode 100644
> index 49e4105378f6..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,g070vvn01.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -AU Optronics Corporation 7.0" FHD (800 x 480) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,g070vvn01"
> -- backlight: phandle of the backlight device attached to the panel
> -- power-supply: single regulator to provide the supply voltage
> -
> -Required nodes:
> -- port: Parallel port mapping to connect this display
> -
> -This panel needs single power supply voltage. Its backlight is conntrolled
> -via PWM signal.
> -
> -Example:
> ---------
> -
> -Example device-tree definition when connected to iMX6Q based board
> -
> -	lcd_panel: lcd-panel {
> -		compatible = "auo,g070vvn01";
> -		backlight = <&backlight_lcd>;
> -		power-supply = <&reg_display>;
> -
> -		port {
> -			lcd_panel_in: endpoint {
> -				remote-endpoint = <&lcd_display_out>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,g101evn010.txt b/Documentation/devicetree/bindings/display/panel/auo,g101evn010.txt
> deleted file mode 100644
> index bc6a0c858e23..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,g101evn010.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -AU Optronics Corporation 10.1" (1280x800) color TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,g101evn010"
> -- power-supply: as specified in the base binding
> -
> -Optional properties:
> -- backlight: as specified in the base binding
> -- enable-gpios: as specified in the base binding
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt b/Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt
> deleted file mode 100644
> index 85626edf63e5..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -AU Optronics Corporation 10.4" (800x600) color TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,g104sn02"
> -- power-supply: as specified in the base binding
> -
> -Optional properties:
> -- backlight: as specified in the base binding
> -- enable-gpios: as specified in the base binding
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,g133han01.txt b/Documentation/devicetree/bindings/display/panel/auo,g133han01.txt
> deleted file mode 100644
> index 3afc76747824..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,g133han01.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,g133han01"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,g185han01.txt b/Documentation/devicetree/bindings/display/panel/auo,g185han01.txt
> deleted file mode 100644
> index ed657c2141d4..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,g185han01.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,g185han01"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,p320hvn03.txt b/Documentation/devicetree/bindings/display/panel/auo,p320hvn03.txt
> deleted file mode 100644
> index 59bb6cd8aa75..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,p320hvn03.txt
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,p320hvn03"
> -- power-supply: as specified in the base binding
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,t215hvn01.txt b/Documentation/devicetree/bindings/display/panel/auo,t215hvn01.txt
> deleted file mode 100644
> index cbd9da3f03b1..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,t215hvn01.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,t215hvn01"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/avic,tm070ddh03.txt b/Documentation/devicetree/bindings/display/panel/avic,tm070ddh03.txt
> deleted file mode 100644
> index b6f2f3e8f44e..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/avic,tm070ddh03.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
> -
> -Required properties:
> -- compatible: should be "avic,tm070ddh03"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.txt b/Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.txt
> deleted file mode 100644
> index 55183d360032..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -BOE HV070WSA-100 7.01" WSVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "boe,hv070wsa-100"
> -- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
> -- enable-gpios: GPIO pin to enable and disable panel (active high)
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> -
> -The device node can contain one 'port' child node with one child
> -'endpoint' node, according to the bindings defined in [1]. This
> -node should describe panel's video bus.
> -
> -[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -Example:
> -
> -	panel: panel {
> -		compatible = "boe,hv070wsa-100";
> -		power-supply = <&vcc_3v3_reg>;
> -		enable-gpios = <&gpd1 3 GPIO_ACTIVE_HIGH>;
> -		port {
> -			panel_ep: endpoint {
> -				remote-endpoint = <&bridge_out_ep>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/boe,nv101wxmn51.txt b/Documentation/devicetree/bindings/display/panel/boe,nv101wxmn51.txt
> deleted file mode 100644
> index b258d6a91ec6..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/boe,nv101wxmn51.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "boe,nv101wxmn51"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.txt b/Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.txt
> deleted file mode 100644
> index 50be5e2438b2..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Boe Corporation 8.0" WUXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "boe,tv080wum-nl0"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.txt b/Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.txt
> deleted file mode 100644
> index 057f7f3f6dbe..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
> -
> -Required properties:
> -- compatible: should be "cdtech,s043wq26h-ct7"
> -- power-supply: as specified in the base binding
> -
> -Optional properties:
> -- backlight: as specified in the base binding
> -- enable-gpios: as specified in the base binding
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.txt b/Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.txt
> deleted file mode 100644
> index 505615dfa0df..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -CDTech(H.K.) Electronics Limited 7" 800x480 color TFT-LCD panel
> -
> -Required properties:
> -- compatible: should be "cdtech,s070wv95-ct16"
> -- power-supply: as specified in the base binding
> -
> -Optional properties:
> -- backlight: as specified in the base binding
> -- enable-gpios: as specified in the base binding
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.txt b/Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.txt
> deleted file mode 100644
> index dd22685d2adc..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "chunghwa,claa070wp03xg"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wa01a.txt b/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wa01a.txt
> deleted file mode 100644
> index f24614e4d5ec..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wa01a.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "chunghwa,claa101wa01a"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wb03.txt b/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wb03.txt
> deleted file mode 100644
> index 0ab2c05a4c22..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wb03.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "chunghwa,claa101wb03"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.txt b/Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.txt
> deleted file mode 100644
> index 897085ee3cd4..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.txt
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
> -
> -Required properties:
> -- compatible: should be "dataimage,scf0700c48ggu18"
> -- power-supply: as specified in the base binding
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/dlc,dlc1010gig.txt b/Documentation/devicetree/bindings/display/panel/dlc,dlc1010gig.txt
> deleted file mode 100644
> index fbf5dcd15661..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/dlc,dlc1010gig.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -DLC Display Co. DLC1010GIG 10.1" WXGA TFT LCD Panel
> -
> -Required properties:
> -- compatible: should be "dlc,dlc1010gig"
> -- power-supply: See simple-panel.txt
> -
> -Optional properties:
> -- enable-gpios: See simple-panel.txt
> -- backlight: See simple-panel.txt
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/edt,et-series.txt b/Documentation/devicetree/bindings/display/panel/edt,et-series.txt
> deleted file mode 100644
> index b7ac1c725f97..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/edt,et-series.txt
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -Emerging Display Technology Corp. Displays
> -==========================================
> -
> -
> -Display bindings for EDT Display Technology Corp. Displays which are
> -compatible with the simple-panel binding, which is specified in
> -simple-panel.txt
> -
> -3,5" QVGA TFT Panels
> ---------------------
> -+-----------------+---------------------+-------------------------------------+
> -| Identifier      | compatbile          | description                         |
> -+=================+=====================+=====================================+
> -| ET035012DM6     | edt,et035012dm6     | 3.5" QVGA TFT LCD panel             |
> -+-----------------+---------------------+-------------------------------------+
> -
> -4,3" WVGA TFT Panels
> ---------------------
> -
> -+-----------------+---------------------+-------------------------------------+
> -| Identifier      | compatbile          | description                         |
> -+=================+=====================+=====================================+
> -| ETM0430G0DH6    | edt,etm0430g0dh6    | 480x272 TFT Display                 |
> -+-----------------+---------------------+-------------------------------------+
> -
> -5,7" WVGA TFT Panels
> ---------------------
> -
> -+-----------------+---------------------+-------------------------------------+
> -| Identifier      | compatbile          | description                         |
> -+=================+=====================+=====================================+
> -| ET057090DHU     | edt,et057090dhu     | 5.7" VGA TFT LCD panel              |
> -+-----------------+---------------------+-------------------------------------+
> -
> -
> -7,0" WVGA TFT Panels
> ---------------------
> -
> -+-----------------+---------------------+-------------------------------------+
> -| Identifier      | compatbile          | description                         |
> -+=================+=====================+=====================================+
> -| ETM0700G0DH6    | edt,etm070080dh6    | WVGA TFT Display with capacitive    |
> -|                 | edt,etm0700g0dh6    | Touchscreen                         |
> -+-----------------+---------------------+-------------------------------------+
> -| ETM0700G0BDH6   | edt,etm070080bdh6   | Same as ETM0700G0DH6 but with       |
> -|                 |                     | inverted pixel clock.               |
> -+-----------------+---------------------+-------------------------------------+
> -| ETM0700G0EDH6   | edt,etm070080edh6   | Same display as the ETM0700G0BDH6,  |
> -|                 |                     | but with changed Hardware for the   |
> -|                 |                     | backlight and the touch interface   |
> -+-----------------+---------------------+-------------------------------------+
> -| ET070080DH6     | edt,etm070080dh6    | Same timings as the ETM0700G0DH6,   |
> -|                 |                     | but with resistive touch.           |
> -+-----------------+---------------------+-------------------------------------+
> -
> diff --git a/Documentation/devicetree/bindings/display/panel/evervision,vgg804821.txt b/Documentation/devicetree/bindings/display/panel/evervision,vgg804821.txt
> deleted file mode 100644
> index 82d22e191ac3..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/evervision,vgg804821.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -Evervision Electronics Co. Ltd. VGG804821 5.0" WVGA TFT LCD Panel
> -
> -Required properties:
> -- compatible: should be "evervision,vgg804821"
> -- power-supply: See simple-panel.txt
> -
> -Optional properties:
> -- backlight: See simple-panel.txt
> -- enable-gpios: See simple-panel.txt
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/foxlink,fl500wvr00-a0t.txt b/Documentation/devicetree/bindings/display/panel/foxlink,fl500wvr00-a0t.txt
> deleted file mode 100644
> index b47f9d87bc19..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/foxlink,fl500wvr00-a0t.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Foxlink Group 5" WVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "foxlink,fl500wvr00-a0t"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt b/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt
> deleted file mode 100644
> index 6c9156fc3478..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -FriendlyELEC HD702E 800x1280 LCD panel
> -
> -HD702E lcd is FriendlyELEC developed eDP LCD panel with 800x1280
> -resolution. It has built in Goodix, GT9271 captive touchscreen
> -with backlight adjustable via PWM.
> -
> -Required properties:
> -- compatible: should be "friendlyarm,hd702e"
> -- power-supply: regulator to provide the supply voltage
> -
> -Optional properties:
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Optional nodes:
> -- Video port for LCD panel input.
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> -
> -Example:
> -
> -	panel {
> -		compatible ="friendlyarm,hd702e", "simple-panel";
> -		backlight = <&backlight>;
> -		power-supply = <&vcc3v3_sys>;
> -
> -		port {
> -			panel_in_edp: endpoint {
> -				remote-endpoint = <&edp_out_panel>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/giantplus,gpg482739qs5.txt b/Documentation/devicetree/bindings/display/panel/giantplus,gpg482739qs5.txt
> deleted file mode 100644
> index 24b0b624434b..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/giantplus,gpg482739qs5.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -GiantPlus GPG48273QS5 4.3" (480x272) WQVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "giantplus,gpg48273qs5"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/hannstar,hsd070pww1.txt b/Documentation/devicetree/bindings/display/panel/hannstar,hsd070pww1.txt
> deleted file mode 100644
> index 7da1d5c038ff..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/hannstar,hsd070pww1.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -HannStar Display Corp. HSD070PWW1 7.0" WXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "hannstar,hsd070pww1"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/hannstar,hsd100pxn1.txt b/Documentation/devicetree/bindings/display/panel/hannstar,hsd100pxn1.txt
> deleted file mode 100644
> index 8270319a99de..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/hannstar,hsd100pxn1.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
> -
> -Required properties:
> -- compatible: should be "hannstar,hsd100pxn1"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/hit,tx23d38vm0caa.txt b/Documentation/devicetree/bindings/display/panel/hit,tx23d38vm0caa.txt
> deleted file mode 100644
> index 04caaae19af6..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/hit,tx23d38vm0caa.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "hit,tx23d38vm0caa"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,at043tn24.txt b/Documentation/devicetree/bindings/display/panel/innolux,at043tn24.txt
> deleted file mode 100644
> index 4104226b61bc..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/innolux,at043tn24.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Innolux AT043TN24 4.3" WQVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "innolux,at043tn24"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,at070tn92.txt b/Documentation/devicetree/bindings/display/panel/innolux,at070tn92.txt
> deleted file mode 100644
> index 3e10cd782491..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/innolux,at070tn92.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Innolux AT070TN92 7.0" WQVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "innolux,at070tn92"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,g070y2-l01.txt b/Documentation/devicetree/bindings/display/panel/innolux,g070y2-l01.txt
> deleted file mode 100644
> index 7c234cf68e11..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/innolux,g070y2-l01.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -Innolux G070Y2-L01 7" WVGA (800x480) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "innolux,g070y2-l01"
> -- power-supply: as specified in the base binding
> -
> -Optional properties:
> -- backlight: as specified in the base binding
> -- enable-gpios: as specified in the base binding
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,g101ice-l01.txt b/Documentation/devicetree/bindings/display/panel/innolux,g101ice-l01.txt
> deleted file mode 100644
> index 9e7590465227..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/innolux,g101ice-l01.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Innolux Corporation 10.1" G101ICE-L01 WXGA (1280x800) LVDS panel
> -
> -Required properties:
> -- compatible: should be "innolux,g101ice-l01"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,g121i1-l01.txt b/Documentation/devicetree/bindings/display/panel/innolux,g121i1-l01.txt
> deleted file mode 100644
> index 2743b07cd2f2..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/innolux,g121i1-l01.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Innolux Corporation 12.1" WXGA (1280x800) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "innolux,g121i1-l01"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,g121x1-l03.txt b/Documentation/devicetree/bindings/display/panel/innolux,g121x1-l03.txt
> deleted file mode 100644
> index 649744620ae1..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/innolux,g121x1-l03.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Innolux Corporation 12.1" G121X1-L03 XGA (1024x768) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "innolux,g121x1-l03"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,n116bge.txt b/Documentation/devicetree/bindings/display/panel/innolux,n116bge.txt
> deleted file mode 100644
> index 081bb939ed31..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/innolux,n116bge.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "innolux,n116bge"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,n156bge-l21.txt b/Documentation/devicetree/bindings/display/panel/innolux,n156bge-l21.txt
> deleted file mode 100644
> index 7825844aafdf..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/innolux,n156bge-l21.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -InnoLux 15.6" WXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "innolux,n156bge-l21"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,zj070na-01p.txt b/Documentation/devicetree/bindings/display/panel/innolux,zj070na-01p.txt
> deleted file mode 100644
> index 824f87f1526d..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/innolux,zj070na-01p.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "innolux,zj070na-01p"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt b/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
> deleted file mode 100644
> index be7ac666807b..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "koe,tx14d24vm1bpa"
> -- backlight: phandle of the backlight device attached to the panel
> -- power-supply: single regulator to provide the supply voltage
> -
> -Required nodes:
> -- port: Parallel port mapping to connect this display
> -
> -This panel needs single power supply voltage. Its backlight is conntrolled
> -via PWM signal.
> -
> -Example:
> ---------
> -
> -Example device-tree definition when connected to iMX53 based board
> -
> -	lcd_panel: lcd-panel {
> -		compatible = "koe,tx14d24vm1bpa";
> -		backlight = <&backlight_lcd>;
> -		power-supply = <&reg_3v3>;
> -
> -		port {
> -			lcd_panel_in: endpoint {
> -				remote-endpoint = <&lcd_display_out>;
> -			};
> -		};
> -	};
> -
> -Then one needs to extend the dispX node:
> -
> -	lcd_display: disp1 {
> -
> -		port@1 {
> -			reg = <1>;
> -
> -			lcd_display_out: endpoint {
> -				remote-endpoint = <&lcd_panel_in>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt b/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
> deleted file mode 100644
> index 6a036ede3e28..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> -
> -Required properties:
> -- compatible: should be "koe,tx31d200vm0baa"
> -
> -Optional properties:
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Optional nodes:
> -- Video port for LVDS panel input.
> -
> -Example:
> -	panel {
> -		compatible = "koe,tx31d200vm0baa";
> -		backlight = <&backlight_lvds>;
> -
> -		port {
> -			panel_in: endpoint {
> -				remote-endpoint = <&lvds0_out>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.txt b/Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.txt
> deleted file mode 100644
> index a8e940fe731e..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "kyo,tcg121xglp"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.txt b/Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.txt
> deleted file mode 100644
> index 74ee7ea6b493..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -LeMaker BL035-RGB-002 3.5" QVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "lemaker,bl035-rgb-002"
> -- power-supply: as specified in the base binding
> -
> -Optional properties:
> -- backlight: as specified in the base binding
> -- enable-gpios: as specified in the base binding
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/lg,lb070wv8.txt b/Documentation/devicetree/bindings/display/panel/lg,lb070wv8.txt
> deleted file mode 100644
> index a7588e5259cf..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/lg,lb070wv8.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -LG 7" (800x480 pixels) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "lg,lb070wv8"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/lg,lp079qx1-sp0v.txt b/Documentation/devicetree/bindings/display/panel/lg,lp079qx1-sp0v.txt
> deleted file mode 100644
> index b9877acad012..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/lg,lp079qx1-sp0v.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -LG LP079QX1-SP0V 7.9" (1536x2048 pixels) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "lg,lp079qx1-sp0v"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.txt b/Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.txt
> deleted file mode 100644
> index 42141516f078..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -LG 9.7" (2048x1536 pixels) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "lg,lp097qx1-spa1"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/lg,lp120up1.txt b/Documentation/devicetree/bindings/display/panel/lg,lp120up1.txt
> deleted file mode 100644
> index 8c5de692c55c..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/lg,lp120up1.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -LG 12.0" (1920x1280 pixels) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "lg,lp120up1"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/lg,lp129qe.txt b/Documentation/devicetree/bindings/display/panel/lg,lp129qe.txt
> deleted file mode 100644
> index 9f262e0c5a2e..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/lg,lp129qe.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -LG 12.9" (2560x1700 pixels) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "lg,lp129qe"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt
> deleted file mode 100644
> index 7d8f6eeef6d9..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Mitsubishi "AA070MC01 7.0" WVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "mitsubishi,aa070mc01-ca1"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.txt b/Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.txt
> deleted file mode 100644
> index 71cbc49ecfab..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.txt
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -NEC LCD Technologies, Ltd. 12.1" WXGA (1280x800) LVDS TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "nec,nl12880bc20-05"
> -- power-supply: as specified in the base binding
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.txt b/Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.txt
> deleted file mode 100644
> index 8e1914d1edb8..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -NEC LCD Technologies,Ltd. WQVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "nec,nl4827hc19-05b"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/netron-dy,e231732.txt b/Documentation/devicetree/bindings/display/panel/netron-dy,e231732.txt
> deleted file mode 100644
> index c6d06b5eab51..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/netron-dy,e231732.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Netron-DY E231732 7.0" WSVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "netron-dy,e231732"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/newhaven,nhd-4.3-480272ef-atxl.txt b/Documentation/devicetree/bindings/display/panel/newhaven,nhd-4.3-480272ef-atxl.txt
> deleted file mode 100644
> index e78292b1a131..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/newhaven,nhd-4.3-480272ef-atxl.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Newhaven Display International 480 x 272 TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "newhaven,nhd-4.3-480272ef-atxl"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt b/Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt
> deleted file mode 100644
> index 1a639fd8778d..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "nlt,nl192108ac18-02d"
> -- power-supply: as specified in the base binding
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/nvd,9128.txt b/Documentation/devicetree/bindings/display/panel/nvd,9128.txt
> deleted file mode 100644
> index 17bcd017c678..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/nvd,9128.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "nvd,9128"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/okaya,rs800480t-7x0gp.txt b/Documentation/devicetree/bindings/display/panel/okaya,rs800480t-7x0gp.txt
> deleted file mode 100644
> index ddf8e211d382..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/okaya,rs800480t-7x0gp.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -OKAYA Electric America, Inc. RS800480T-7X0GP 7" WVGA LCD panel
> -
> -Required properties:
> -- compatible: should be "okaya,rs800480t-7x0gp"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino-43-ts.txt b/Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino-43-ts.txt
> deleted file mode 100644
> index 74540a090669..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino-43-ts.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Olimex 4.3" TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "olimex,lcd-olinuxino-43-ts"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/ontat,yx700wv03.txt b/Documentation/devicetree/bindings/display/panel/ontat,yx700wv03.txt
> deleted file mode 100644
> index 3d8a5e029242..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/ontat,yx700wv03.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -On Tat Industrial Company 7" DPI TFT panel.
> -
> -Required properties:
> -- compatible: should be "ontat,yx700wv03"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m05dtc.txt b/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m05dtc.txt
> deleted file mode 100644
> index c16907c02f80..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m05dtc.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -OrtusTech COM37H3M05DTC Blanview 3.7" VGA portrait TFT-LCD panel
> -
> -Required properties:
> -- compatible: should be "ortustech,com37h3m05dtc"
> -
> -Optional properties:
> -- enable-gpios: GPIO pin to enable or disable the panel
> -- backlight: phandle of the backlight device attached to the panel
> -- power-supply: phandle of the regulator that provides the supply voltage
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt b/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt
> deleted file mode 100644
> index 06a73c3f46b5..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -OrtusTech COM37H3M99DTC Blanview 3.7" VGA portrait TFT-LCD panel
> -
> -Required properties:
> -- compatible: should be "ortustech,com37h3m99dtc"
> -
> -Optional properties:
> -- enable-gpios: GPIO pin to enable or disable the panel
> -- backlight: phandle of the backlight device attached to the panel
> -- power-supply: phandle of the regulator that provides the supply voltage
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/ortustech,com43h4m85ulc.txt b/Documentation/devicetree/bindings/display/panel/ortustech,com43h4m85ulc.txt
> deleted file mode 100644
> index de19e9398618..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/ortustech,com43h4m85ulc.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -OrtusTech COM43H4M85ULC Blanview 3.7" TFT-LCD panel
> -
> -Required properties:
> -- compatible: should be "ortustech,com43h4m85ulc"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/osddisplays,osd070t1718-19ts.txt b/Documentation/devicetree/bindings/display/panel/osddisplays,osd070t1718-19ts.txt
> deleted file mode 100644
> index e57883ccdf2f..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/osddisplays,osd070t1718-19ts.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -OSD Displays OSD070T1718-19TS 7" WVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: shall be "osddisplays,osd070t1718-19ts"
> -- power-supply: see simple-panel.txt
> -
> -Optional properties:
> -- backlight: see simple-panel.txt
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory. No other simple-panel properties than
> -the ones specified herein are valid.
> diff --git a/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2045-53ts.txt b/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2045-53ts.txt
> deleted file mode 100644
> index 85c0b2cacfda..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2045-53ts.txt
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -One Stop Displays OSD101T2045-53TS 10.1" 1920x1200 panel
> -
> -Required properties:
> -- compatible: should be "osddisplays,osd101t2045-53ts"
> -- power-supply: as specified in the base binding
> -
> -Optional properties:
> -- backlight: as specified in the base binding
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f004b00.txt b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f004b00.txt
> deleted file mode 100644
> index d328b0341bf4..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f004b00.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Panasonic Corporation 10.1" WUXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "panasonic,vvx10f004b00"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 4a8064e31793..4802ec18b927 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -33,18 +33,213 @@ properties:
>        - ampire,am-480272h3tmqw-t01h
>          # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
>        - ampire,am800480r3tmqwa1h
> +        # AU Optronics Corporation 8.0" WUXGA TFT LCD panel
> +      - auo,b080uan01
> +        # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
> +      - auo,b101aw03
> +        # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
> +      - auo,b101ean01
> +        # AU Optronics Corporation 10.1" WXGA TFT LCD panel
> +      - auo,b101xtn01
>          # AUO B116XAK01 eDP TFT LCD panel
>        - auo,b116xa01
> +        # AU Optronics Corporation 11.6" HD (1366x768) color TFT-LCD panel
> +      - auo,b116xw03
> +        # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
> +      - auo,b133htn01
> +        # AU Optronics Corporation 13.3" WXGA (1366x768) TFT LCD panel
> +      - auo,b133xtn01
> +        # AU Optronics Corporation 7.0" FHD (800 x 480) TFT LCD panel
> +      - auo,g070vvn01
> +        # AU Optronics Corporation 10.1" (1280x800) color TFT LCD panel
> +      - auo,g101evn010
> +        # AU Optronics Corporation 10.4" (800x600) color TFT LCD panel
> +      - auo,g104sn02
> +        # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD panel
> +      - auo,g133han01
> +        # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD panel
> +      - auo,g185han01
> +        # AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
> +      - auo,p320hvn03
> +        # AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD panel
> +      - auo,t215hvn01
> +        # Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
> +      - avic,tm070ddh03
> +        # BOE HV070WSA-100 7.01" WSVGA TFT LCD panel
> +      - boe,hv070wsa-100
> +        # BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
> +      - boe,nv101wxmn51
>          # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
>        - boe,nv140fhmn49
> +        # Boe Corporation 8.0" WUXGA TFT LCD panel
> +      - boe,tv080wum-nl0
> +        # CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
> +      - cdtech,s043wq26h-ct7
> +        # CDTech(H.K.) Electronics Limited 7" 800x480 color TFT-LCD panel
> +      - cdtech,s070wv95-ct16
> +        # Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel
> +      - chunghwa,claa070wp03xg
> +        # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
> +      - chunghwa,claa101wa01a
> +        # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
> +      - chunghwa,claa101wb03
> +        # DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
> +      - dataimage,scf0700c48ggu18
> +        # DLC Display Co. DLC1010GIG 10.1" WXGA TFT LCD Panel
> +      - dlc,dlc1010gig
> +        # Emerging Display Technology Corp. 3.5" QVGA TFT LCD panel
> +      - edt,et035012dm6
> +        # Emerging Display Technology Corp. 480x272 TFT Display
> +      - edt,etm0430g0dh6
> +        # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel
> +      - edt,et057090dhu
> +        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
> +      - edt,etm070080dh6
> +        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
> +      - edt,etm0700g0dh6
> +        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
> +        # Same as ETM0700G0DH6 but with inverted pixel clock.
> +      - edt,etm070080bdh6
> +        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
> +        # Same display as the ETM0700G0BDH6, but with changed hardware for the
> +        # backlight and the touch interface.
> +      - edt,etm070080edh6
> +        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
> +        # Same timings as the ETM0700G0DH6, but with resistive touch.
> +      - edt,etm070080dh6
> +        # Evervision Electronics Co. Ltd. VGG804821 5.0" WVGA TFT LCD Panel
> +      - evervision,vgg804821
> +        # Foxlink Group 5" WVGA TFT LCD panel
> +      - foxlink,fl500wvr00-a0t
>          # Frida FRD350H54004 3.5" QVGA TFT LCD panel
>        - frida,frd350h54004
> +        # FriendlyELEC HD702E 800x1280 LCD panel
> +      - friendlyarm,hd702e
> +        # GiantPlus GPG48273QS5 4.3" (480x272) WQVGA TFT LCD panel
> +      - giantplus,gpg48273qs5
>          # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
>        - giantplus,gpm940b0
> +        # HannStar Display Corp. HSD070PWW1 7.0" WXGA TFT LCD panel
> +      - hannstar,hsd070pww1
> +        # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
> +      - hannstar,hsd100pxn1
> +        # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
> +      - hit,tx23d38vm0caa
> +        # Innolux AT043TN24 4.3" WQVGA TFT LCD panel
> +      - innolux,at043tn24
> +        # Innolux AT070TN92 7.0" WQVGA TFT LCD panel
> +      - innolux,at070tn92
> +        # Innolux G070Y2-L01 7" WVGA (800x480) TFT LCD panel
> +      - innolux,g070y2-l01
> +        # Innolux Corporation 10.1" G101ICE-L01 WXGA (1280x800) LVDS panel
> +      - innolux,g101ice-l01
> +        # Innolux Corporation 12.1" WXGA (1280x800) TFT LCD panel
> +      - innolux,g121i1-l01
> +        # Innolux Corporation 12.1" G121X1-L03 XGA (1024x768) TFT LCD panel
> +      - innolux,g121x1-l03
> +        # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
> +      - innolux,n116bge
> +        # InnoLux 15.6" WXGA TFT LCD panel
> +      - innolux,n156bge-l21
> +        # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
> +      - innolux,zj070na-01p
> +        # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
> +      - koe,tx14d24vm1bpa
> +        # Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
> +      - koe,tx31d200vm0baa
> +        # Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
> +      - kyo,tcg121xglp
> +        # LeMaker BL035-RGB-002 3.5" QVGA TFT LCD panel
> +      - lemaker,bl035-rgb-002
> +        # LG 7" (800x480 pixels) TFT LCD panel
> +      - lg,lb070wv8
> +        # LG LP079QX1-SP0V 7.9" (1536x2048 pixels) TFT LCD panel
> +      - lg,lp079qx1-sp0v
> +        # LG 9.7" (2048x1536 pixels) TFT LCD panel
> +      - lg,lp097qx1-spa1
> +        # LG 12.0" (1920x1280 pixels) TFT LCD panel
> +      - lg,lp120up1
> +        # LG 12.9" (2560x1700 pixels) TFT LCD panel
> +      - lg,lp129qe
> +        # Mitsubishi "AA070MC01 7.0" WVGA TFT LCD panel
> +      - mitsubishi,aa070mc01-ca1
> +        # NEC LCD Technologies, Ltd. 12.1" WXGA (1280x800) LVDS TFT LCD panel
> +      - nec,nl12880bc20-05
> +        # NEC LCD Technologies,Ltd. WQVGA TFT LCD panel
> +      - nec,nl4827hc19-05b
> +        # Netron-DY E231732 7.0" WSVGA TFT LCD panel
> +      - netron-dy,e231732
> +        # Newhaven Display International 480 x 272 TFT LCD panel
> +      - newhaven,nhd-4.3-480272ef-atxl
> +        # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
> +      - nlt,nl192108ac18-02d
> +        # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
> +      - nvd,9128
> +        # OKAYA Electric America, Inc. RS800480T-7X0GP 7" WVGA LCD panel
> +      - okaya,rs800480t-7x0gp
> +        # Olimex 4.3" TFT LCD panel
> +      - olimex,lcd-olinuxino-43-ts
> +        # On Tat Industrial Company 7" DPI TFT panel.
> +      - ontat,yx700wv03
> +        # OrtusTech COM37H3M05DTC Blanview 3.7" VGA portrait TFT-LCD panel
> +      - ortustech,com37h3m05dtc
> +        # OrtusTech COM37H3M99DTC Blanview 3.7" VGA portrait TFT-LCD panel
> +      - ortustech,com37h3m99dtc
> +        # OrtusTech COM43H4M85ULC Blanview 3.7" TFT-LCD panel
> +      - ortustech,com43h4m85ulc
> +        # OSD Displays OSD070T1718-19TS 7" WVGA TFT LCD panel
> +      - osddisplays,osd070t1718-19ts
> +        # One Stop Displays OSD101T2045-53TS 10.1" 1920x1200 panel
> +      - osddisplays,osd101t2045-53ts
> +        # QiaoDian XianShi Corporation 4"3 TFT LCD panel
> +      - qiaodian,qd43003c0-40
> +        # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
> +      - rocktech,rk070er9427
> +        # Samsung 12.2" (2560x1600 pixels) TFT LCD panel
> +      - samsung,lsn122dl01-c01
> +        # Samsung Electronics 10.1" WSVGA TFT LCD panel
> +      - samsung,ltn101nt05
> +        # Samsung Electronics 14" WXGA (1366x768) TFT LCD panel
> +      - samsung,ltn140at29-301
>          # Satoz SAT050AT40H12R2 5.0" WVGA TFT LCD panel
>        - satoz,sat050at40h12r2
> +        # Sharp LQ035Q7DB03 3.5" QVGA TFT LCD panel
> +      - sharp,lq035q7db03
> +        # Sharp LQ070Y3DG3B 7.0" WVGA landscape TFT LCD panel
> +      - sharp,lq070y3dg3b
> +        # Sharp Display Corp. LQ101K1LY04 10.07" WXGA TFT LCD panel
> +      - sharp,lq101k1ly04
> +        # Sharp 12.3" (2400x1600 pixels) TFT LCD panel
> +      - sharp,lq123p1jx31
>          # Sharp LS020B1DD01D 2.0" HQVGA TFT LCD panel
>        - sharp,ls020b1dd01d
> +        # Shelly SCA07010-BFN-LNN 7.0" WVGA TFT LCD panel
> +      - shelly,sca07010-bfn-lnn
> +        # Starry 12.2" (1920x1200 pixels) TFT LCD panel
> +      - starry,kr122ea0sra
> +        # Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
> +      - tianma,tm070jdhg30
> +        # Tianma Micro-electronics TM070RVHG71 7.0" WXGA TFT LCD panel
> +      - tianma,tm070rvhg71
> +        # Toshiba 8.9" WXGA (1280x768) TFT LCD panel
> +      - toshiba,lt089ac29000
> +        # TPK U.S.A. LLC Fusion 7" 800 x 480 (WVGA) LCD panel with capacitive touch
> +      - tpk,f07a-0102
> +        # TPK U.S.A. LLC Fusion 10.1" 1024 x 600 (WSVGA) LCD panel with capacitive touch
> +      - tpk,f10a-0102
> +        # United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
> +        # Supported are LVDS versions (-11T, -19T) and parallel ones
> +        # (-T, -1T, -7T, -20T).
> +      - urt,umsh-8596md-t
> +      - urt,umsh-8596md-1t
> +      - urt,umsh-8596md-7t
> +      - urt,umsh-8596md-11t
> +      - urt,umsh-8596md-19t
> +      - urt,umsh-8596md-20t
> +        # VXT 800x480 color TFT LCD panel
> +      - vxt,vl050-8048nt-c01
> +        # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
> +      - winstar,wf35ltiacd
>  
>    backlight: true
>    enable-gpios: true
> diff --git a/Documentation/devicetree/bindings/display/panel/qiaodian,qd43003c0-40.txt b/Documentation/devicetree/bindings/display/panel/qiaodian,qd43003c0-40.txt
> deleted file mode 100644
> index 0fbdab89ac3d..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/qiaodian,qd43003c0-40.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -QiaoDian XianShi Corporation 4"3 TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "qiaodian,qd43003c0-40"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.txt b/Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.txt
> deleted file mode 100644
> index eb1fb9f8d1f4..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> -
> -Required properties:
> -- compatible: should be "rocktech,rk070er9427"
> -
> -Optional properties:
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Optional nodes:
> -- Video port for LCD panel input.
> -
> -Example:
> -	panel {
> -		compatible = "rocktech,rk070er9427";
> -		backlight = <&backlight_lcd>;
> -
> -		port {
> -			lcd_panel_in: endpoint {
> -				remote-endpoint = <&lcd_display_out>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.txt b/Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.txt
> deleted file mode 100644
> index dba298b43b24..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Samsung 12.2" (2560x1600 pixels) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "samsung,lsn122dl01-c01"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ltn101nt05.txt b/Documentation/devicetree/bindings/display/panel/samsung,ltn101nt05.txt
> deleted file mode 100644
> index ef522c6bb85f..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/samsung,ltn101nt05.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Samsung Electronics 10.1" WSVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "samsung,ltn101nt05"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ltn140at29-301.txt b/Documentation/devicetree/bindings/display/panel/samsung,ltn140at29-301.txt
> deleted file mode 100644
> index e7f969d891cc..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/samsung,ltn140at29-301.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Samsung Electronics 14" WXGA (1366x768) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "samsung,ltn140at29-301"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq035q7db03.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq035q7db03.txt
> deleted file mode 100644
> index 0753f6967279..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/sharp,lq035q7db03.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -Sharp LQ035Q7DB03 3.5" QVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "sharp,lq035q7db03"
> -- power-supply: phandle of the regulator that provides the supply voltage
> -
> -Optional properties:
> -- enable-gpios: GPIO pin to enable or disable the panel
> -- backlight: phandle of the backlight device attached to the panel
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.txt
> deleted file mode 100644
> index 95534b55ee5f..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -Sharp LQ070Y3DG3B 7.0" WVGA landscape TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "sharp,lq070y3dg3b"
> -
> -Optional properties:
> -- enable-gpios: GPIO pin to enable or disable the panel
> -- backlight: phandle of the backlight device attached to the panel
> -- power-supply: phandle of the regulator that provides the supply voltage
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.txt
> deleted file mode 100644
> index 4aff25b8dfe6..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Sharp Display Corp. LQ101K1LY04 10.07" WXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "sharp,lq101k1ly04"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq123p1jx31.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq123p1jx31.txt
> deleted file mode 100644
> index bcb0e8a29f71..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/sharp,lq123p1jx31.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Sharp 12.3" (2400x1600 pixels) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "sharp,lq123p1jx31"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/shelly,sca07010-bfn-lnn.txt b/Documentation/devicetree/bindings/display/panel/shelly,sca07010-bfn-lnn.txt
> deleted file mode 100644
> index fc1ea9e26c94..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/shelly,sca07010-bfn-lnn.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Shelly SCA07010-BFN-LNN 7.0" WVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "shelly,sca07010-bfn-lnn"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt b/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt
> deleted file mode 100644
> index 1e87fe6078af..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Starry 12.2" (1920x1200 pixels) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "starry,kr122ea0sra"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/tianma,tm070jdhg30.txt b/Documentation/devicetree/bindings/display/panel/tianma,tm070jdhg30.txt
> deleted file mode 100644
> index eb9501a82e25..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/tianma,tm070jdhg30.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "tianma,tm070jdhg30"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
> deleted file mode 100644
> index b25261e63a6d..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Tianma Micro-electronics TM070RVHG71 7.0" WXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "tianma,tm070rvhg71"
> -- power-supply: single regulator to provide the supply voltage
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Required nodes:
> -- port: LVDS port mapping to connect this display
> -
> -This panel needs single power supply voltage. Its backlight is conntrolled
> -via PWM signal.
> -
> -Example:
> ---------
> -
> -Example device-tree definition when connected to iMX6Q based board
> -
> -	panel: panel-lvds0 {
> -		compatible = "tianma,tm070rvhg71";
> -		backlight = <&backlight_lvds>;
> -		power-supply = <&reg_lvds>;
> -
> -		port {
> -			panel_in_lvds0: endpoint {
> -				remote-endpoint = <&lvds0_out>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt b/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt
> deleted file mode 100644
> index 89826116628c..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -Toshiba 8.9" WXGA (1280x768) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "toshiba,lt089ac29000"
> -- power-supply: as specified in the base binding
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.txt b/Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.txt
> deleted file mode 100644
> index a2613b9675df..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.txt
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -TPK U.S.A. LLC Fusion 7" integrated projected capacitive touch display with,
> -800 x 480 (WVGA) LCD panel.
> -
> -Required properties:
> -- compatible: should be "tpk,f07a-0102"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.txt b/Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.txt
> deleted file mode 100644
> index b9d051196ba9..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.txt
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -TPK U.S.A. LLC Fusion 10.1" integrated projected capacitive touch display with,
> -1024 x 600 (WSVGA) LCD panel.
> -
> -Required properties:
> -- compatible: should be "tpk,f10a-0102"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.txt b/Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.txt
> deleted file mode 100644
> index 088a6cea5015..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
> -
> -Supported are LVDS versions (-11T, -19T) and parallel ones
> -(-T, -1T, -7T, -20T).
> -
> -Required properties:
> -- compatible: should be one of:
> -  "urt,umsh-8596md-t",
> -  "urt,umsh-8596md-1t",
> -  "urt,umsh-8596md-7t",
> -  "urt,umsh-8596md-11t",
> -  "urt,umsh-8596md-19t",
> -  "urt,umsh-8596md-20t".
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/vl050_8048nt_c01.txt b/Documentation/devicetree/bindings/display/panel/vl050_8048nt_c01.txt
> deleted file mode 100644
> index b42bf06bbd99..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/vl050_8048nt_c01.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -VXT 800x480 color TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "vxt,vl050-8048nt-c01"
> -- power-supply: as specified in the base binding
> -
> -Optional properties:
> -- backlight: as specified in the base binding
> -- enable-gpios: as specified in the base binding
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd.txt b/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd.txt
> deleted file mode 100644
> index 2a7e6e3ba64c..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd.txt
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "winstar,wf35ltiacd"
> -- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> -
> -Example:
> -	backlight: backlight {
> -		compatible = "pwm-backlight";
> -		pwms = <&hlcdc_pwm 0 50000 PWM_POLARITY_INVERTED>;
> -		brightness-levels = <0 31 63 95 127 159 191 223 255>;
> -		default-brightness-level = <191>;
> -		power-supply = <&bl_reg>;
> -	};
> -
> -	bl_reg: backlight_regulator {
> -		compatible = "regulator-fixed";
> -		regulator-name = "backlight-power-supply";
> -		regulator-min-microvolt = <5000000>;
> -		regulator-max-microvolt = <5000000>;
> -	};
> -
> -	panel: panel {
> -		compatible = "winstar,wf35ltiacd", "simple-panel";
> -		backlight = <&backlight>;
> -		power-supply = <&panel_reg>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			panel_input: endpoint {
> -				remote-endpoint = <&hlcdc_panel_output>;
> -			};
> -		};
> -	};
> -
> -	panel_reg: panel_regulator {
> -		compatible = "regulator-fixed";
> -		regulator-name = "panel-power-supply";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa9add598b7d..40bf702cfb13 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5514,7 +5514,6 @@ S:	Supported
>  F:	drivers/gpu/drm/fsl-dcu/
>  F:	Documentation/devicetree/bindings/display/fsl,dcu.txt
>  F:	Documentation/devicetree/bindings/display/fsl,tcon.txt
> -F:	Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.txt
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  
>  DRM DRIVERS FOR FREESCALE IMX
> -- 
> 2.20.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
