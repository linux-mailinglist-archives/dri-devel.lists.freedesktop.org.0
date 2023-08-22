Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9443B783FD2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14F910E323;
	Tue, 22 Aug 2023 11:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41C910E323;
 Tue, 22 Aug 2023 11:45:40 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9AB71660722B;
 Tue, 22 Aug 2023 12:45:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692704739;
 bh=MiJSYH5aW1TpyRdaUDOPV16m9eaLpiLtrZPWgi287yk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RpVt+bSRSdhckPdWvAGEnbs9W/bbR3uDHl2LTJsedZInchLCm/QmsZgBLt3+mMEnf
 jtVoec8DsojWdcLVcapjdcbRgSfXwZrbDvGDTLU9k78pU5L5GbbwQGrxC6s24PNUvR
 h+atZn/jTBla3G76X05rjAEHrjwdviZ4KhanVaiDK9SUCAqq2On5m6ZHWLY34BEswQ
 gBpnUnnbE72twMhnN2f7S+Ii2AePNzrySDbW325jNgSn1VFlJBTnzKnxcA3XDDbUIi
 Xeu0TaLF6Zk9o/kXTc4LwJusgWxX2NCdM621kQ1l1BAyFNQKkT9tYs1MfXBdniEayc
 tJApRTgSFUevw==
Date: Tue, 22 Aug 2023 14:45:35 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH v2 08/34] drm/amd/display: document AMDGPU pre-defined
 transfer functions
Message-ID: <20230822144535.2105ac46.pekka.paalanen@collabora.com>
In-Reply-To: <20230810160314.48225-9-mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-9-mwen@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Aug 2023 15:02:48 -0100
Melissa Wen <mwen@igalia.com> wrote:

> Brief documentation about pre-defined transfer function usage on AMD
> display driver and standardized EOTFs and inverse EOTFs.
> 
> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index cc2187c0879a..7f13bcdaf016 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -85,6 +85,45 @@ void amdgpu_dm_init_color_mod(void)
>  }
>  
>  #ifdef AMD_PRIVATE_COLOR
> +/* Pre-defined Transfer Functions (TF)
> + *
> + * AMD driver supports pre-defined mathematical functions for transferring
> + * between encoded values and optical/linear space. Depending on HW color caps,
> + * ROMs and curves built by the AMD color module support these transforms.
> + *
> + * The driver-specific color implementation exposes properties for pre-blending
> + * degamma TF, shaper TF (before 3D LUT), and blend(dpp.ogam) TF and
> + * post-blending regamma (mpc.ogam) TF. However, only pre-blending degamma
> + * supports ROM curves. AMD color module uses pre-defined coefficients to build
> + * curves for the other blocks. What can be done by each color block is
> + * described by struct dpp_color_capsand struct mpc_color_caps.
> + *
> + * AMD driver-specific color API exposes the following pre-defined transfer
> + * functions:
> + *
> + * - Linear/Unity: linear/identity relationship between pixel value and
> + *   luminance value;

I asked about linear/unity on the previous patch.

> + * - Gamma 2.2, Gamma 2.4, Gamma 2.6: pure gamma functions;

I'd explain these as pure power functions. Gamma function is
something completely different:
https://en.wikipedia.org/wiki/Gamma_function

> + * - sRGB: 2.4 gamma with small initial linear section as standardized by IEC
> + *   61966-2-1:1999;

I'd leave out the mention of "2.4 gamma". Yes, the value of the gamma
parameter is 2.4, but the curve is actually an approximation of the
pure 2.2 power function suitable for integer arithmetic[1].

One could call it "The piece-wise transfer function from IEC ...".

[1] https://www.w3.org/Graphics/Color/sRGB.html

> + * - BT.709 (BT.1886): 2.4 gamma with differences in the dark end of the scale.
> + *   Used in HD-TV and standardized by ITU-R BT.1886;

BT.1886 has two more parameters (a.k.a contrast and brightness). What
are their values?

It's also quite different from BT.709 inverse OETF. BT.1886 uses
exponent 2.4 while inverse of BT.709 OETF has exponent approximately
2.22. This difference is intentional and accounts for shooting vs.
viewing environment differences.

Either the curve comes from BT.709 or BT.1886. Which one is it?

Would be nice to spell out the mathematical formula in these cases.

> + * - PQ (Perceptual Quantizer): used for HDR display, allows luminance range
> + *   capability of 0 to 10,000 nits; standardized by SMPTE ST 2084.

Right, but since we are working on numbers here,
is the PQ EOTF [0, 1] -> [0, 1] or [0, 10000]?


Thanks,
pq

> + *
> + * In the driver-specific API, color block names attached to TF properties
> + * suggest the intention regarding non-linear encoding pixel's luminance
> + * values. As some newer encodings don't use gamma curve, we make encoding and
> + * decoding explicit by defining an enum list of transfer functions supported
> + * in terms of EOTF and inverse EOTF, where:
> + *
> + * - EOTF (electro-optical transfer function): is the transfer function to go
> + *   from the encoded value to an optical (linear) value. De-gamma functions
> + *   traditionally do this.
> + * - Inverse EOTF (simply the inverse of the EOTF): is usually intended to go
> + *   from an optical/linear space (which might have been used for blending)
> + *   back to the encoded values. Gamma functions traditionally do this. 
> + */
>  static const char * const
>  amdgpu_transfer_function_names[] = {
>  	[AMDGPU_TRANSFER_FUNCTION_DEFAULT]		= "Default",

