Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85F8775EC6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 14:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23FE10E428;
	Wed,  9 Aug 2023 12:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05E710E428
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 12:21:10 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RLTg92cT2z9tDM;
 Wed,  9 Aug 2023 12:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1691583670; bh=tOT1osPBkbssLomMjoThRwJE147WBpwQAMeRtw90GuY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=NHfDiBRp5sJb/tKRiQ7goxZuvHPbbguJdKP//y7LPE9Lemxf0xqEjrWgab4byRnic
 HbjBatl4rs371UTSON/Jh2mNqZSGeDORg4kBJOtpsZSXOoB0IjmfLDIDyrr+pVGk4y
 145EloZGl0i+av8oaaFb5nHnk/o8ax/FWNpwin+0=
X-Riseup-User-ID: 1B173ED595774DAA80A1634FEEC2C579ED06EC718622D16C28AC21164FC3FA17
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RLTfs23FLzJmsF;
 Wed,  9 Aug 2023 12:20:52 +0000 (UTC)
Message-ID: <28268a1b-090c-237a-79dd-ca58de712a1e@riseup.net>
Date: Wed, 9 Aug 2023 09:20:50 -0300
MIME-Version: 1.0
Subject: Re: [PATCH -next 6/7] drm/format-helper: Remove unnecessary NULL
 values
Content-Language: en-US
To: Ruan Jinjie <ruanjinjie@huawei.com>, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 sean@poorly.run, marijn.suijten@somainline.org, bskeggs@redhat.com,
 kherbst@redhat.com, lyude@redhat.com, kraxel@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com,
 paulo.miguel.almeida.rodenas@gmail.com, wenjing.liu@amd.com,
 haoping.liu@amd.com, Charlene.Liu@amd.com, chiahsuan.chung@amd.com,
 george.shen@amd.com, sancchen@amd.com, tony.tascioglu@amd.com,
 jaehyun.chung@amd.com, tales.aparecida@gmail.com, drv@mailo.com,
 aurabindo.pillai@amd.com, quic_vpolimer@quicinc.com, jiasheng@iscas.ac.cn,
 noralf@tronnes.org, jose.exposito89@gmail.com, javierm@redhat.com,
 mairacanal@riseup.net, davidgow@google.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
References: <20230809034445.434902-1-ruanjinjie@huawei.com>
 <20230809034445.434902-7-ruanjinjie@huawei.com>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20230809034445.434902-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/08/23 00:44, Ruan Jinjie wrote:
> The NULL initialization of the pointers assigned by
> kunit_kzalloc() first is not necessary, because if kunit_kzalloc()
> failed, the pointers will be assigned NULL, otherwise it works
> as usual. so remove it.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  .../gpu/drm/tests/drm_format_helper_test.c    | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>

Best Regards,
~Arthur Grillo

> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 474bb7a1c4ee..1db12d8ed23c 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -452,7 +452,7 @@ static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
>  
>  static u16 *le16buf_to_cpu(struct kunit *test, const __le16 *buf, size_t buf_size)
>  {
> -	u16 *dst = NULL;
> +	u16 *dst;
>  	int n;
>  
>  	dst = kunit_kzalloc(test, sizeof(*dst) * buf_size, GFP_KERNEL);
> @@ -467,7 +467,7 @@ static u16 *le16buf_to_cpu(struct kunit *test, const __le16 *buf, size_t buf_siz
>  
>  static u32 *le32buf_to_cpu(struct kunit *test, const __le32 *buf, size_t buf_size)
>  {
> -	u32 *dst = NULL;
> +	u32 *dst;
>  	int n;
>  
>  	dst = kunit_kzalloc(test, sizeof(*dst) * buf_size, GFP_KERNEL);
> @@ -482,7 +482,7 @@ static u32 *le32buf_to_cpu(struct kunit *test, const __le32 *buf, size_t buf_siz
>  
>  static __le32 *cpubuf_to_le32(struct kunit *test, const u32 *buf, size_t buf_size)
>  {
> -	__le32 *dst = NULL;
> +	__le32 *dst;
>  	int n;
>  
>  	dst = kunit_kzalloc(test, sizeof(*dst) * buf_size, GFP_KERNEL);
> @@ -509,7 +509,7 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_gray8_result *result = &params->gray8_result;
>  	size_t dst_size;
> -	u8 *buf = NULL;
> +	u8 *buf;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -539,7 +539,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_rgb332_result *result = &params->rgb332_result;
>  	size_t dst_size;
> -	u8 *buf = NULL;
> +	u8 *buf;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -569,7 +569,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_rgb565_result *result = &params->rgb565_result;
>  	size_t dst_size;
> -	u16 *buf = NULL;
> +	u16 *buf;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -605,7 +605,7 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_xrgb1555_result *result = &params->xrgb1555_result;
>  	size_t dst_size;
> -	u16 *buf = NULL;
> +	u16 *buf;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -636,7 +636,7 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_argb1555_result *result = &params->argb1555_result;
>  	size_t dst_size;
> -	u16 *buf = NULL;
> +	u16 *buf;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -667,7 +667,7 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_rgba5551_result *result = &params->rgba5551_result;
>  	size_t dst_size;
> -	u16 *buf = NULL;
> +	u16 *buf;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -698,7 +698,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_rgb888_result *result = &params->rgb888_result;
>  	size_t dst_size;
> -	u8 *buf = NULL;
> +	u8 *buf;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -732,7 +732,7 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_argb8888_result *result = &params->argb8888_result;
>  	size_t dst_size;
> -	u32 *buf = NULL;
> +	u32 *buf;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -763,7 +763,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_xrgb2101010_result *result = &params->xrgb2101010_result;
>  	size_t dst_size;
> -	u32 *buf = NULL;
> +	u32 *buf;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -794,7 +794,7 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_argb2101010_result *result = &params->argb2101010_result;
>  	size_t dst_size;
> -	u32 *buf = NULL;
> +	u32 *buf;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -825,7 +825,7 @@ static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_mono_result *result = &params->mono_result;
>  	size_t dst_size;
> -	u8 *buf = NULL;
> +	u8 *buf;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
