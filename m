Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD0LBvWkrmkFHQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:46:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73165237502
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C41D10E4D2;
	Mon,  9 Mar 2026 10:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jr6w9uFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B8C10E4D2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 10:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xDq/qJ1evcHxOLL6gwE/+lgZWdXUAIGmTRrejtTbvOo=; b=jr6w9uFLVUU9g67CsEAeLIg+2C
 f0GzrAAV6qBd4jsfzWzVZHJh8hs+WSxLhXclH5oujHKiqXXzkk3qdKkWbBXJNSmRxvYUFyzq3iSgO
 Y0gmeF4I3w4+PI2gIF7F/X+8RTsgRWJICIMvJYANr7ultUug5pQqwfGKp3OOwB80z6biCATJTz8lJ
 oaHmge37GGeqhywUOzmAulzpPUzmc2MkTdum8nVE//sF2jVdZf3Gz/W47qIuJLUGFxyRU69bfEyZd
 Kvsfc1HeDNkdJTnA6wrYxlO6dVq9kcAwLmaP2aGoOw47lIkv3rky+QpLV3NfHLqCWgOtB/F3KtpJy
 p3h23Rwg==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vzY7g-00C0Qk-Ia; Mon, 09 Mar 2026 11:46:04 +0100
Message-ID: <ff55737e-d05c-4937-8a27-72ab6fc5c477@igalia.com>
Date: Mon, 9 Mar 2026 10:46:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm/tests: add a test to exercise ttm_bo_swapout
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: Christian Koenig <christian.koenig@amd.com>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, kernel-dev@igalia.com,
 Karolina Stolarek <karolina.stolarek@intel.com>
References: <20260306-ttm_bo_swapout_test-v1-1-aaab11091ee0@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260306-ttm_bo_swapout_test-v1-1-aaab11091ee0@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 73165237502
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cascardo@igalia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:kernel-dev@igalia.com,m:karolina.stolarek@intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_SPAM(0.00)[0.033];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:mid,igalia.com:email,intel.com:email]
X-Rspamd-Action: no action


On 06/03/2026 18:00, Thadeu Lima de Souza Cascardo wrote:
> Currently, ttm_bo_swapout is not exercised by the TTM KUnit tests.
> 
> It used to be exercised until commit 76689eb52667 ("drm/ttm: remove
> ttm_bo_validate_swapout test"), but that test was removed as it was
> unreliable due to requiring to allocate half of the system memory.
> 
> Calling ttm_bo_swapout directly with a single allocated BO, however, does
> not suffer from that problem, and was able to detect a UAF introduced by
> commit c06da4b3573a ("drm/ttm: Tidy usage of local variables a little
> bit"), when built with KASAN.
> 
> When applying a fix to that UAF, the test passed without any issues.

Thank you for closing this gap and again for fixing up after me. I have 
some minor comments below, but the test looks good to me and either way:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

> 
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> ---
>   drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c | 42 ++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 6d95447a989d20d60227025be874265b2b491f59..9848c008a443d70ad16c6e018381878f0898e487 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -759,6 +759,47 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
>   	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
>   }
>   
> +static void ttm_bo_validate_swapout(struct kunit *test)
> +{
> +	u32 mem_type = TTM_PL_TT;
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_operation_ctx ctx_init = { };
> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
> +	struct ttm_resource_manager *man;
> +	struct ttm_placement *placement;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	int err;
> +	s64 swapped;
> +
> +	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
> +	man = ttm_manager_type(priv->ttm_dev, mem_type);
> +	KUNIT_ASSERT_NOT_NULL(test, man);
> +
> +	place = ttm_place_kunit_init(test, mem_type, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, place);
> +	placement = ttm_placement_kunit_init(test, place, 1);
> +	KUNIT_ASSERT_NOT_NULL(test, placement);

Above two seem to have internal asserts so you could drop them from the 
test.

> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	drm_gem_private_object_init(priv->drm, &bo->base, MANAGER_SIZE);
> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement,
> +				   PAGE_SIZE, &ctx_init, NULL, NULL,
> +				   &dummy_ttm_bo_destroy);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	swapped = ttm_bo_swapout(priv->ttm_dev, &ctx_init, man, GFP_KERNEL, 1);

Is there a particular reason to ask for 1 page to swap out instead of 
matching the bo size? Might be more obvious (I dare not to say future 
proof) to match it with the expectation from the below assert.

> +	KUNIT_EXPECT_EQ(test, swapped, MANAGER_SIZE / PAGE_SIZE);

Side note, it looks like ttm_bo_swapout() kerneldoc should be fixed to 
correctly say return is number of pages, not bytes.

Regards,

Tvrtko

> +	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, TTM_PL_SYSTEM);
> +	KUNIT_EXPECT_TRUE(test, bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED);
> +
> +	ttm_bo_fini(bo);
> +	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
> +}
> +
>   static void ttm_bo_validate_happy_evict(struct kunit *test)
>   {
>   	u32 mem_type = TTM_PL_VRAM, mem_multihop = TTM_PL_TT,
> @@ -1153,6 +1194,7 @@ static struct kunit_case ttm_bo_validate_test_cases[] = {
>   	KUNIT_CASE(ttm_bo_validate_move_fence_signaled),
>   	KUNIT_CASE_PARAM(ttm_bo_validate_move_fence_not_signaled,
>   			 ttm_bo_validate_wait_gen_params),
> +	KUNIT_CASE(ttm_bo_validate_swapout),
>   	KUNIT_CASE(ttm_bo_validate_happy_evict),
>   	KUNIT_CASE(ttm_bo_validate_all_pinned_evict),
>   	KUNIT_CASE(ttm_bo_validate_allowed_only_evict),
> 
> ---
> base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
> change-id: 20260306-ttm_bo_swapout_test-ad130eac0bcf
> 
> Best regards,

