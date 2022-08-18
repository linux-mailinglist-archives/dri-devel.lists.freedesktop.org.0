Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385E6598575
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 16:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF4DB59E0;
	Thu, 18 Aug 2022 14:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D07B9E62
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 14:11:42 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4M7mz225ybz9s7R;
 Thu, 18 Aug 2022 14:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1660831902; bh=j+DxlEr8fn35/Z3HR4n4j+H0KgWDHTQq1f5WIzyA4iw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BJ83lK5Ip235hwR8N9+qySS1T/4rFaM5CX8xsl4kgHNlKFZzzNRrJdf7yVzdINLiG
 N+ZoSehYCFjuPd8tBUjniINEgR8iDNPikuJYtZLG6YsYWxeMPy4CB4PaUJusBxpey1
 REuQZ6bbs1htmsiGKGp1xGf9urThwFAcL6PCk4So=
X-Riseup-User-ID: 32E05DCA2CD760F96F2B2EAA5B69AB0FCDA066030B382245F2E1EC0D6C853FFA
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4M7myz6J3Gz1yX6;
 Thu, 18 Aug 2022 14:11:39 +0000 (UTC)
Message-ID: <a03448d0-fae4-01ed-87b2-a5955d1a5995@riseup.net>
Date: Thu, 18 Aug 2022 11:11:36 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/cmdline-parser: Use assert when needed
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220817211236.252091-1-michal.winiarski@intel.com>
 <20220817211236.252091-2-michal.winiarski@intel.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220817211236.252091-2-michal.winiarski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 Arthur Grillo <arthur.grillo@usp.br>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/17/22 18:12, Michał Winiarski wrote:
> Expecting to observe a specific value, when the function responsible for
> setting the value has failed will lead to extra noise in test output.
> Use assert when the situation calls for it.
> Also - very small tidying up around the changed areas (whitespace).
> 
> v2: Leave out the locals (drm_connector is huge) (lkp)
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra Canal

> ---
>   .../gpu/drm/tests/drm_cmdline_parser_test.c   | 80 +++++++++----------
>   1 file changed, 40 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> index 3a46c7d6f2aa..09b806e27506 100644
> --- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> +++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> @@ -16,7 +16,7 @@ static void drm_cmdline_test_force_e_only(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "e";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_FALSE(test, mode.specified);
>   	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> @@ -34,7 +34,7 @@ static void drm_cmdline_test_force_D_only_not_digital(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "D";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_FALSE(test, mode.specified);
>   	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> @@ -56,7 +56,7 @@ static void drm_cmdline_test_force_D_only_hdmi(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "D";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &connector_hdmi, &mode));
>   	KUNIT_EXPECT_FALSE(test, mode.specified);
>   	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> @@ -78,7 +78,7 @@ static void drm_cmdline_test_force_D_only_dvi(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "D";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &connector_dvi, &mode));
>   	KUNIT_EXPECT_FALSE(test, mode.specified);
>   	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> @@ -96,7 +96,7 @@ static void drm_cmdline_test_force_d_only(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "d";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_FALSE(test, mode.specified);
>   	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> @@ -114,7 +114,7 @@ static void drm_cmdline_test_res(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -136,7 +136,7 @@ static void drm_cmdline_test_res_vesa(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480M";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -158,7 +158,7 @@ static void drm_cmdline_test_res_vesa_rblank(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480MR";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -180,7 +180,7 @@ static void drm_cmdline_test_res_rblank(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480R";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -202,7 +202,7 @@ static void drm_cmdline_test_res_bpp(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480-24";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -225,7 +225,7 @@ static void drm_cmdline_test_res_refresh(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480@60";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -248,7 +248,7 @@ static void drm_cmdline_test_res_bpp_refresh(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480-24@60";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -272,7 +272,7 @@ static void drm_cmdline_test_res_bpp_refresh_interlaced(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480-24@60i";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -294,9 +294,9 @@ static void drm_cmdline_test_res_bpp_refresh_interlaced(struct kunit *test)
>   static void drm_cmdline_test_res_bpp_refresh_margins(struct kunit *test)
>   {
>   	struct drm_cmdline_mode mode = { };
> -	const char *cmdline =  "720x480-24@60m";
> +	const char *cmdline = "720x480-24@60m";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -318,9 +318,9 @@ static void drm_cmdline_test_res_bpp_refresh_margins(struct kunit *test)
>   static void drm_cmdline_test_res_bpp_refresh_force_off(struct kunit *test)
>   {
>   	struct drm_cmdline_mode mode = { };
> -	const char *cmdline =  "720x480-24@60d";
> +	const char *cmdline = "720x480-24@60d";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -342,9 +342,9 @@ static void drm_cmdline_test_res_bpp_refresh_force_off(struct kunit *test)
>   static void drm_cmdline_test_res_bpp_refresh_force_on(struct kunit *test)
>   {
>   	struct drm_cmdline_mode mode = { };
> -	const char *cmdline =  "720x480-24@60e";
> +	const char *cmdline = "720x480-24@60e";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -368,7 +368,7 @@ static void drm_cmdline_test_res_bpp_refresh_force_on_analog(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480-24@60D";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -395,7 +395,7 @@ static void drm_cmdline_test_res_bpp_refresh_force_on_digital(struct kunit *test
>   	};
>   	const char *cmdline = "720x480-24@60D";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -443,7 +443,7 @@ static void drm_cmdline_test_res_margins_force_on(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480me";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -465,7 +465,7 @@ static void drm_cmdline_test_res_vesa_margins(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480Mm";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -487,7 +487,7 @@ static void drm_cmdline_test_name(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "NTSC";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
>   	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> @@ -499,7 +499,7 @@ static void drm_cmdline_test_name_bpp(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "NTSC-24";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
>   
> @@ -514,7 +514,7 @@ static void drm_cmdline_test_name_option(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "NTSC,rotate=180";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
> @@ -526,7 +526,7 @@ static void drm_cmdline_test_name_bpp_option(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "NTSC-24,rotate=180";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
> @@ -540,7 +540,7 @@ static void drm_cmdline_test_rotate_0(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480,rotate=0";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -563,7 +563,7 @@ static void drm_cmdline_test_rotate_90(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480,rotate=90";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -586,7 +586,7 @@ static void drm_cmdline_test_rotate_180(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480,rotate=180";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -609,7 +609,7 @@ static void drm_cmdline_test_rotate_270(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480,rotate=270";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -632,7 +632,7 @@ static void drm_cmdline_test_hmirror(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480,reflect_x";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -655,7 +655,7 @@ static void drm_cmdline_test_vmirror(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480,reflect_y";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -679,7 +679,7 @@ static void drm_cmdline_test_margin_options(struct kunit *test)
>   	const char *cmdline =
>   		"720x480,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -705,7 +705,7 @@ static void drm_cmdline_test_multiple_options(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480,rotate=270,reflect_x";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -728,7 +728,7 @@ static void drm_cmdline_test_bpp_extra_and_option(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480-24e,rotate=180";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -752,7 +752,7 @@ static void drm_cmdline_test_extra_and_option(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "720x480e,rotate=180";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_TRUE(test, mode.specified);
>   	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -774,7 +774,7 @@ static void drm_cmdline_test_freestanding_options(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "margin_right=14,margin_left=24,margin_bottom=36,margin_top=42";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_FALSE(test, mode.specified);
>   	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> @@ -797,7 +797,7 @@ static void drm_cmdline_test_freestanding_force_e_and_options(struct kunit *test
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "e,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_FALSE(test, mode.specified);
>   	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> @@ -820,7 +820,7 @@ static void drm_cmdline_test_panel_orientation(struct kunit *test)
>   	struct drm_cmdline_mode mode = { };
>   	const char *cmdline = "panel_orientation=upside_down";
>   
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>   									  &no_connector, &mode));
>   	KUNIT_EXPECT_FALSE(test, mode.specified);
>   	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
