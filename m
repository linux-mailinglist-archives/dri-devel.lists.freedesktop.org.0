Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B87F879CB7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 21:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B780C10EC45;
	Tue, 12 Mar 2024 20:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CRUkd854";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7014010EC44
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 20:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=icJZII2NzZ8YTpuhYylAOUy/6nsXY8cVerNtIDwM3N0=; b=CRUkd854ft2j4bz3Ta5s9wxdpW
 KZuvLszbFxDwC1rbr1BFT8JX1mnOL+WEVb+YD6QUy7MYhqPzIMUxjR75lAEYMoi5qzKwkzhjUgHww
 d6hPK0z/ufuR8dR32hsPazYwRrvbrJ3fs/Kw8WpviryU1FfXaTrp8dnKSbAvNm0bVhAxE0hg0JSPf
 1Ioz89EYCUK2NEkWLuHL4xNEJkBXUVy13nyhw34zdpL8U5XfKUyjZuZh8y+pfp3n2cBD6C9NxxinN
 xqivvzWOMTQEY9UXoz6lFRPSOvk6zfXPSbRynlYziCP4Cu0P93xCZP9+ohaqe9juLchDaIgfecLue
 ggVquWyg==;
Received: from [189.6.17.125] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rk8Xk-009VhK-IL; Tue, 12 Mar 2024 21:16:13 +0100
Date: Tue, 12 Mar 2024 17:16:01 -0300
From: Melissa Wen <mwen@igalia.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH 6/7] drm/vkms: Change the gray RGB representation
Message-ID: <4jvdfkfnqsn6dcuybruyvexop5du4sd6mmmjvtmeso5kyg4sdi@klimifhnenqm>
References: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
 <20240306-louis-vkms-conv-v1-6-5bfe7d129fdd@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306-louis-vkms-conv-v1-6-5bfe7d129fdd@riseup.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/06, Arthur Grillo wrote:
> Using the drm_fixed calls, this needs to be changed. Which in fact is
> more correct, colour.YCbCr_to_RGB() gives 0x8080 for same the yuv
> parameters.

Hi Arthur,

For consistency, shouldn't this change be together with the previous
patch that uses the drm_fixed api? I mean, a single patch that changes
to drm_fixed calls and adjust the color values accordingly, avoiding
room for mismatches?

Melissa
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/vkms/tests/vkms_format_test.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> index 66cdd83c3d25..49125cf76eb5 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> @@ -48,7 +48,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>  		.n_colors = 6,
>  		.colors = {
>  			{"white", {0xff, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
> -			{"gray",  {0x80, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
> +			{"gray",  {0x80, 0x80, 0x80}, {0xffff, 0x8080, 0x8080, 0x8080}},
>  			{"black", {0x00, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
>  			{"red",   {0x4c, 0x55, 0xff}, {0xffff, 0xffff, 0x0000, 0x0000}},
>  			{"green", {0x96, 0x2c, 0x15}, {0xffff, 0x0000, 0xffff, 0x0000}},
> @@ -71,7 +71,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>  		.n_colors = 6,
>  		.colors = {
>  			{"white", {0xeb, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
> -			{"gray",  {0x7e, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
> +			{"gray",  {0x7e, 0x80, 0x80}, {0xffff, 0x8080, 0x8080, 0x8080}},
>  			{"black", {0x10, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
>  			{"red",   {0x51, 0x5a, 0xf0}, {0xffff, 0xffff, 0x0000, 0x0000}},
>  			{"green", {0x91, 0x36, 0x22}, {0xffff, 0x0000, 0xffff, 0x0000}},
> @@ -94,7 +94,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>  		.n_colors = 4,
>  		.colors = {
>  			{"white", {0xff, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
> -			{"gray",  {0x80, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
> +			{"gray",  {0x80, 0x80, 0x80}, {0xffff, 0x8080, 0x8080, 0x8080}},
>  			{"black", {0x00, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
>  			{"red",   {0x36, 0x63, 0xff}, {0xffff, 0xffff, 0x0000, 0x0000}},
>  			{"green", {0xb6, 0x1e, 0x0c}, {0xffff, 0x0000, 0xffff, 0x0000}},
> @@ -117,7 +117,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>  		.n_colors = 4,
>  		.colors = {
>  			{"white", {0xeb, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
> -			{"gray",  {0x7e, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
> +			{"gray",  {0x7e, 0x80, 0x80}, {0xffff, 0x8080, 0x8080, 0x8080}},
>  			{"black", {0x10, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
>  			{"red",   {0x3f, 0x66, 0xf0}, {0xffff, 0xffff, 0x0000, 0x0000}},
>  			{"green", {0xad, 0x2a, 0x1a}, {0xffff, 0x0000, 0xffff, 0x0000}},
> @@ -140,7 +140,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>  		.n_colors = 4,
>  		.colors = {
>  			{"white", {0xff, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
> -			{"gray",  {0x80, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
> +			{"gray",  {0x80, 0x80, 0x80}, {0xffff, 0x8080, 0x8080, 0x8080}},
>  			{"black", {0x00, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
>  			{"red",   {0x43, 0x5c, 0xff}, {0xffff, 0xffff, 0x0000, 0x0000}},
>  			{"green", {0xad, 0x24, 0x0b}, {0xffff, 0x0000, 0xffff, 0x0000}},
> @@ -163,7 +163,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>  		.n_colors = 4,
>  		.colors = {
>  			{"white", {0xeb, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
> -			{"gray",  {0x7e, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
> +			{"gray",  {0x7e, 0x80, 0x80}, {0xffff, 0x8080, 0x8080, 0x8080}},
>  			{"black", {0x10, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
>  			{"red",   {0x4a, 0x61, 0xf0}, {0xffff, 0xffff, 0x0000, 0x0000}},
>  			{"green", {0xa4, 0x2f, 0x19}, {0xffff, 0x0000, 0xffff, 0x0000}},
> 
> -- 
> 2.43.0
> 
