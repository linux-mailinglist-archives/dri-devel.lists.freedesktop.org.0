Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B01381294
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 23:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94106E43F;
	Fri, 14 May 2021 21:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127916E43F;
 Fri, 14 May 2021 21:07:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ebi71zvFYQpFUNTxrhkrYXSrv3gF20Zm37h/4XFJ+EYZkzCTZ/u5JYDgCfFRZcflU7S+UWcoOdcuCcsY+xEYoBFbOyfc5oqqcKP5i3j30w5/ya3thi/T774vbgsbhhFmuaT9c2DZfLbsVsef7nmpI01SMkGDQrn2TxjzcIMs7MftedEpzPA4bkQ6CFwNlBEyIpmI3PmroMqT3OBqo20UalZ1XhETW0t4wovmfCPDF3DY29ZRiIsMIA7q8rMAa46mBxpX7iFJTFvpsxFatgR/VG/3jbyt033Ix79JCYE7jlACF/Ff/bCeBgXgyCttCiHNrSKKlOMHawCbxdDXQe27ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oe+iLwCAcrhqPP5HkSQWrv4kxq0Iudbtbx+/tz2zjGM=;
 b=ERWHSS4Dq1NMBAWw+TqRyakEEu07RN10s3NFk/YokY46nksHztQ1tAmo3T3d/AG5zCVRv3qBBqW2GtWzRikbK4ePQr9W9wC9XPLfNKGlxacf8jOHrE40s8hwC8oe6jFSIUctibwzqVoPhZB/hosfZ/K++u8aRupLVS+bAtRbsLknUHPnUlEhYMb0hTg/RvjVVAado+9ERQOdclYa6I67tHtaeQsLW38KGSwKrUPUVcv+41O3rBfK7zQZXTs5ykK/hBrYCVbUqJFtyV/rlfjJ4ldCx9ywTVDcxjCI90+vYWHG4wP5L51qXN6apeprrr0HHER5uSKXJvnE9gneArnwDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oe+iLwCAcrhqPP5HkSQWrv4kxq0Iudbtbx+/tz2zjGM=;
 b=BHdbiSm0di5XzJkq34H9wG3gHaK3PnVzqfgfHo6iSg9v6HvD5ndfuDSjE+sE9m9eirJQ3VUR6YbIRYgpz0/CHwopPx3JPRSEapfj9kLoczuoEyjpYItHcoqLgfEhq16X2pV1zsKiCWOY+0vEaEl6XVIu7QmRU3aHy9MJtveM6/o=
Received: from BN6PR17CA0057.namprd17.prod.outlook.com (2603:10b6:405:75::46)
 by DM4PR12MB5392.namprd12.prod.outlook.com (2603:10b6:5:39a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 14 May
 2021 21:07:32 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::53) by BN6PR17CA0057.outlook.office365.com
 (2603:10b6:405:75::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 14 May 2021 21:07:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Fri, 14 May 2021 21:07:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 14 May
 2021 16:07:31 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 14 May 2021 16:07:30 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>
Subject: [RFC PATCH v2 1/6] drm/doc: Color Management and HDR10 RFC
Date: Fri, 14 May 2021 17:07:15 -0400
Message-ID: <20210514210720.157892-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514210720.157892-1-harry.wentland@amd.com>
References: <20210514210720.157892-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d125360-6725-49c9-1f46-08d9171c4a2b
X-MS-TrafficTypeDiagnostic: DM4PR12MB5392:
X-Microsoft-Antispam-PRVS: <DM4PR12MB53925B615F2A4DCB6014C9F68C509@DM4PR12MB5392.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mkSfAxbaMC7sCyjXqL9jL7ZcKJOcwdA4wyQOXJ9Q8IfTM5qzVfhpdIs3O7B2R8dj/8EMqDjasb7vt00sa8JQJjFrjYT/6T0LjfqWNlNND3pd0WcT3/EUw/m6qcO0UNhVaA8gCE9mg+hjjZJ+EZfuYwoH19wCliHPJjcjQmd2Wj/RK6oCPZXTgN9wuvAPmbpBb044KsxOgpwv37Nwx5PVVJDr5eEzv5JQC2ukqogoy9f8oiXsJ7Yo6c0Kw4csL71IQ1TR3P/fgLujhm22xFFOauO3xgUZ3kgEwIDQPlNZaMkRMTRBA6ZIUD18lfVxubM69pKWHYTjDIiKk8kp9QAumYIRXhEd1Tkh1KL5CEvRVwzBBGDrY3DIwh0lF1ORUirDxMS/U5dtK1mZzmGLHIHjPY+0KzCBYG/S7G4sY369pg2Z0ctefPT2QWhV3t6w7/yvhSH8UIymk/oE2GeQsN8POZ4CLGrzL+hw5D+UjgJH8DpI+RHHuRIwhK8WLCiApBHnaTG11JyAuRX7/+J6Px1NBJv8Bvi2xFGurQB3pCn89h8WipGMn7OtPHGajt9TkauQadAlxtSbhVQgWRFYLpFWy6bk6+KGnFk0F/6fxsGDhE1DSnLH2yW+pyb3II2BlxUbY7Lo3EiiltL7PxBKOTZq7a55AcIPw2xWTF97mN07di90tE7ztM/vycYGIL8+6bNS9OmaJNh/bxPXYZf/hwqemwrOVS8asu0ca7wueEn6XE7nkx8pNesPMtqR1EoNVaUEEhhOERZQRSrx0Cbf5AAgL4f1kvcqidIj0LYyYsmjm/w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966006)(36840700001)(82740400003)(83380400001)(1076003)(8936002)(110136005)(70206006)(316002)(47076005)(81166007)(356005)(44832011)(6666004)(30864003)(86362001)(8676002)(54906003)(7696005)(82310400003)(5660300002)(966005)(26005)(70586007)(426003)(2616005)(4326008)(2906002)(336012)(36756003)(36860700001)(478600001)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 21:07:32.0049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d125360-6725-49c9-1f46-08d9171c4a2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5392
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, Shashank.Sharma@amd.com,
 Shirish.S@amd.com, hersenxs.wu@amd.com, Vitaly.Prosyak@amd.com,
 laurentiu.palcu@oss.nxp.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new DRM RFC doc section to capture the RFC previously only
described in the cover letter at
https://patchwork.freedesktop.org/series/89506/

Update the RFC based on feedback received:
 * don't use color_encoding property to define color space
 * expand on reason for SDR luminance definition
 * define input/output transfer functions for luminance space transforms,
   rather than defining the luminance space of an input directly

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 Documentation/gpu/rfc/hdr-wide-gamut.rst | 416 +++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst          |   4 +
 2 files changed, 420 insertions(+)
 create mode 100644 Documentation/gpu/rfc/hdr-wide-gamut.rst

diff --git a/Documentation/gpu/rfc/hdr-wide-gamut.rst b/Documentation/gpu/rfc/hdr-wide-gamut.rst
new file mode 100644
index 000000000000..132898668eac
--- /dev/null
+++ b/Documentation/gpu/rfc/hdr-wide-gamut.rst
@@ -0,0 +1,416 @@
+==============================
+HDR & Wide Color Gamut Support
+==============================
+
+.. role:: wy-text-strike
+
+ToDo
+====
+
+* :wy-text-strike:`Reformat as RST kerneldoc` - done
+* :wy-text-strike:`Don't use color_encoding for color_space definitions` - done
+* :wy-text-strike:`Update SDR luminance description and reasoning` - done
+* :wy-text-strike:`Clarify 3D LUT required for some color space transformations` - done
+* :wy-text-strike:`Highlight need for named color space and EOTF definitions` - done
+* :wy-text-strike:`Define transfer function API` - done
+* :wy-text-strike:`Draft upstream plan` - done
+* Reference to wayland and/or Chrome plans
+* Sketch view of HW pipeline for couple of HW implementations
+
+
+Upstream Plan
+=============
+
+* Reach consensus on DRM/KMS API
+* Implement support in amdgpu
+* Implement IGT tests
+* Add API support to Weston, ChromiumOS, or other canonical open-source project interested in HDR
+* Merge user-space
+* Merge kernel patches
+
+
+Introduction
+============
+
+We are looking to enable HDR support for a couple of single-plane and
+multi-plane scenarios. To do this effectively we recommend new interfaces
+to drm_plane. Below I'll give a bit of background on HDR and why we
+propose these interfaces.
+
+
+Overview and background
+=======================
+
+Defining a pixel's luminance
+----------------------------
+
+The luminance space of pixels in a framebuffer/plane presented to the
+display is not well defined in the DRM/KMS APIs. It is usually assumed to
+be in a 2.2 or 2.4 gamma space and has no mapping to an absolute luminance
+value; it is interpreted in relative terms.
+
+Luminance can be measured and described in absolute terms as candela
+per meter squared, or cd/m2, or nits. Even though a pixel value can be
+mapped to luminance in a linear fashion to do so without losing a lot of
+detail requires 16-bpc color depth. The reason for this is that human
+perception can distinguish roughly between a 0.5-1% luminance delta. A
+linear representation is suboptimal, wasting precision in the highlights
+and losing precision in the shadows.
+
+A gamma curve is a decent approximation to a human's perception of
+luminance, but the PQ (perceptual quantizer) function [1] improves on
+it. It also defines the luminance values in absolute terms, with the
+highest value being 10,000 nits and the lowest 0.0005 nits.
+
+Using a content that's defined in PQ space we can approximate the real
+world in a much better way.
+
+Here are some examples of real-life objects and their approximate
+luminance values:
+
+.. flat-table::
+   :header-rows: 1
+
+   * - Object
+     - Luminance in nits
+   
+   *  - Fluorescent light
+      - 10,000
+  
+   *  - Highlights
+      - 1,000 - sunlight
+ 
+   *  - White Objects
+      - 250 - 1,000
+   
+   *  - Typical Objects
+      - 1 - 250
+   
+   *  - Shadows
+      - 0.01 - 1
+   
+   *  - Ultra Blacks
+      - 0 - 0.0005
+
+Transfer functions
+------------------
+
+Traditionally we used the terms gamma and de-gamma to describe the
+encoding of a pixel's luminance value and the operation to transfer from
+a linear luminance space to the non-linear space used to encode the
+pixels. Since some newer encodings don't use a gamma curve I suggest
+we refer to non-linear encodings using the terms EOTF, and OETF[2], or
+simply as transfer function in general.
+
+The EOTF (Electro-Optical Transfer Function) describes how to transfer
+from an electrical signal to an optical signal. This was traditionally
+done by the de-gamma function.
+
+The OETF (Opto Electronic Transfer Function) describes how to transfer
+from an optical signal to an electronic signal. This was traditionally
+done by the gamma function.
+
+More generally we can name the transfer function describing the transform
+between scanout and blending space as the **input transfer function**, and
+the transfer function describing the transform from blending space to the
+output space as **output transfer function**.
+
+
+Mastering Luminances
+--------------------
+
+Even though we are able to describe the absolute luminance of a pixel
+using the PQ 2084 EOTF we are presented with physical limitations of the
+display technologies on the market today. Here are a few examples of
+luminance ranges of displays.
+
+.. flat-table::
+   :header-rows: 1
+
+   * - Display
+     - Luminance range in nits
+   
+   *  - Typical PC display
+      - 0.3 - 200
+  
+   *  - Excellent LCD HDTV
+      - 0.3 - 400
+ 
+   *  - HDR LCD w/ local dimming
+      - 0.05 - 1,500
+   
+Since no display can currently show the full 0.0005 to 10,000 nits
+luminance range of PQ the display will need to tone-map the HDR content,
+i.e to fit the content within a display's capabilities. To assist
+with tone-mapping HDR content is usually accompanied by a metadata
+that describes (among other things) the minimum and maximum mastering
+luminance, i.e. the maximum and minimum luminance of the display that
+was used to master the HDR content.
+
+The HDR metadata is currently defined on the drm_connector via the
+hdr_output_metadata blob property.
+
+It might be useful to define per-plane hdr metadata, as different planes
+might have been mastered differently.
+
+
+SDR Luminance
+-------------
+
+Traditional SDR content's maximum white luminance is not well defined.
+Some like to define it at 80 nits, others at 200 nits. It also depends
+to a large extent on the environmental viewing conditions. In practice
+this means that we need to define the maximum SDR white luminance, either
+in nits, or as a ratio.
+
+One Windows API defines it as a ratio against 80 nits:
+https://docs.microsoft.com/en-us/windows-hardware/drivers/ddi/dispmprt/ns-dispmprt-_dxgkarg_settargetadjustedcolorimetry2
+
+Another Windows API defines it as a nits value:
+https://docs.microsoft.com/en-us/windows-hardware/drivers/ddi/dispmprt/ns-dispmprt-_dxgkarg_settargetadjustedcolorimetry2
+
+The Wayland color management proposal uses Apple's definition of EDR as a
+ratio of the HDR range vs SDR range: 
+https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unstable/color-management/color.rst#id8
+
+If a display's maximum HDR white level is correctly reported it is trivial
+to convert between all of the above representations of SDR white level. If
+it is not, defining SDR luminance as a nits value, or a ratio vs a fixed
+nits value is preferred, assuming we are blending in linear space.
+
+It is our experience that many HDR displays do not report maximum white
+level correctly
+
+
+Let There Be Color
+------------------
+
+So far we've only talked about luminance, ignoring colors altogether. Just
+like in the luminance space, traditionally the color space of display
+outputs has not been well defined. Similar to how an EOTF defines a
+mapping of pixel data to an absolute luminance value, the color space
+maps color information for each pixel onto the CIE 1931 chromaticity
+space. This can be thought of as a mapping to an absolute, real-life,
+color value.
+
+A color space is defined by its primaries and white point. The primaries
+and white point are expressed as coordinates in the CIE 1931 color
+space. Think of the red primary as the reddest red that can be displayed
+within the color space. Same for green and blue.
+
+Examples of color spaces are:
+
+.. flat-table::
+   :header-rows: 1
+
+   * - Color Space
+     - Description
+   
+   *  - BT 601
+      - similar to BT 709
+  
+   *  - BT 709
+      - used by sRGB content; ~53% of BT 2020
+ 
+   *  - DCI-P3
+      - used by most HDR displays; ~72% of BT 2020
+
+   *  - BT 2020
+      - standard for most HDR content
+
+
+
+Color Primaries and White Point
+-------------------------------
+
+Just like displays can currently not represent the entire 0.0005 -
+10,000 nits HDR range of the PQ 2084 EOTF, they are currently not capable
+of representing the entire BT.2020 color Gamut. For this reason video
+content will often specify the color primaries and white point used to
+master the video, in order to allow displays to be able to map the image
+as best as possible onto the display's gamut.
+
+
+Displays and Tonemapping
+------------------------
+
+External displays are able to do their own tone and color mapping, based
+on the mastering luminance, color primaries, and white space defined in
+the HDR metadata.
+
+Some internal panels might not include the complex HW to do tone and color
+mapping on their own and will require the display driver to perform
+appropriate mapping.
+
+
+How are we solving the problem?
+===============================
+
+Input and Output Transfer functions
+-----------------------------------
+
+We define an input transfer function on drm_plane to describe the
+transform from framebuffer to blending space.
+
+We define an output transfer function on drm_crtc to describe the
+transform from blending space to display space.
+
+The transfer function can be a pre-defined function, such as PQ EOTF, or
+a custom LUT. A driver will be able to specify support for specific
+transfer functions, including custom ones.
+
+Defining the transfer function in this way allows us to support in on HW
+that uses ROMs to support these transforms, as well as on HW that use
+LUT definitions that are complex and don't map easily onto a standard LUT
+definition.
+
+We will not define per-plane LUTs in this patchset as the scope of our
+current work only deals with pre-defined transfer functions. This API has
+the flexibility to add custom 1D or 3D LUTs at a later date.
+
+In order to support the existing 1D de-gamma and gamma LUTs on the drm_crtc
+we will include a "custom 1D" enum value to indicate that the custom gamma and
+de-gamma 1D LUTs should be used.
+
+Possible transfer functions:
+
+.. flat-table::
+   :header-rows: 1
+
+   * - Transfer Function
+     - Description
+   
+   *  - Gamma 2.2
+      - a simple 2.2 gamma function
+  
+   *  - sRGB
+      - 2.4 gamma with small initial linear section
+ 
+   *  - PQ 2084
+      - SMPTE ST 2084; used for HDR video and allows for up to 10,000 nit support
+
+   *  - Linear
+      - Linear relationship between pixel value and luminance value
+
+   *  - Custom 1D
+      - Custom 1D de-gamma and gamma LUTs; one LUT per color
+
+   *  - Custom 3D
+      - Custom 3D LUT (to be defined)
+
+
+Describing SDR Luminance
+------------------------------
+
+Since many displays do no correctly advertise the HDR white level we
+propose to define the SDR white level in nits.
+
+We define a new drm_plane property to specify the white level of an SDR
+plane.
+
+
+Defining the color space
+------------------------
+
+We propose to add a new color space property to drm_plane to define a
+plane's color space.
+
+While some color space conversions can be performed with a simple color
+transformation matrix (CTM) others require a 3D LUT.
+
+
+Defining mastering color space and luminance
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+ToDo
+
+
+
+Pixel Formats
+~~~~~~~~~~~~~
+
+The pixel formats, such as ARGB8888, ARGB2101010, P010, or FP16 are
+unrelated to color space and EOTF definitions. HDR pixels can be formatted
+in different ways but in order to not lose precision HDR content requires
+at least 10 bpc precision. For this reason ARGB2101010, P010, and FP16 are
+the obvious candidates for HDR. ARGB2101010 and P010 have the advantage
+of requiring only half the bandwidth as FP16, while FP16 has the advantage
+of enough precision to operate in a linear space, i.e. without EOTF.
+
+
+
+Use Cases
+=========
+
+RGB10 HDR plane - composited HDR video & desktop
+------------------------------------------------
+
+A single, composited plane of HDR content. The use-case is a video player
+on a desktop with the compositor owning the composition of SDR and HDR
+content. The content shall be PQ BT.2020 formatted. The drm_connector's
+hdr_output_metadata shall be set.
+
+
+P010 HDR video plane + RGB8 SDR desktop plane
+---------------------------------------------
+A normal 8bpc desktop plane, with a P010 HDR video plane underlayed. The
+HDR plane shall be PQ BT.2020 formatted. The desktop plane shall specify
+an SDR boost value. The drm_connector's hdr_output_metadata shall be set.
+
+
+One XRGB8888 SDR Plane - HDR output
+-----------------------------------
+
+In order to support a smooth transition we recommend an OS that supports
+HDR output to provide the hdr_output_metadata on the drm_connector to
+configure the output for HDR, even when the content is only SDR. This will
+allow for a smooth transition between SDR-only and HDR content. In this
+use-case the SDR max luminance value should be provided on the drm_plane.
+
+In DCN we will de-PQ or de-Gamma all input in order to blend in linear
+space. For SDR content we will also apply any desired boost before
+blending. After blending we will then re-apply the PQ EOTF and do RGB
+to YCbCr conversion if needed.
+
+FP16 HDR linear planes
+----------------------
+
+ToDo
+
+
+User Space
+==========
+
+Wayland
+-------
+
+ToDo
+
+
+ChromeOS Ozone
+--------------
+
+ToDo
+
+
+HW support
+==========
+
+ToDo, describe pipeline on a couple different HW platforms
+
+
+References
+==========
+
+* [1] https://en.wikipedia.org/wiki/High-dynamic-range_video#Perceptual_Quantizer
+* [2] https://en.wikipedia.org/wiki/Transfer_functions_in_imaging
+
+
+Further Reading
+===============
+
+* https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unstable/color-management/color.rst
+* http://downloads.bbc.co.uk/rd/pubs/whp/whp-pdf-files/WHP309.pdf
+* https://app.spectracal.com/Documents/White%20Papers/HDR_Demystified.pdf
+
+
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index a8621f7dab8b..5c8eaf8bf587 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -15,3 +15,7 @@ host such documentation:
 
 * Once the code has landed move all the documentation to the right places in
   the main core, helper or driver sections.
+
+  .. toctree::
+
+  hdr-wide-gamut.rst
\ No newline at end of file
-- 
2.31.1

