Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04F5B4780C
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5265110E401;
	Sat,  6 Sep 2025 22:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC3E10E41D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 10:57:53 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 4034C582606
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 10:41:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C647D43121;
 Mon,  1 Sep 2025 10:41:14 +0000 (UTC)
Message-ID: <93b9e1dc-f8d5-4b8d-a7d2-27ba8e09dd54@ghiti.fr>
Date: Mon, 1 Sep 2025 12:41:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/tests: modeset: Add drm connector
 atomic_[duplicate/destroy]_state
To: Xiaolei Wang <xiaolei.wang@windriver.com>,
 dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250827084514.3364009-1-xiaolei.wang@windriver.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250827084514.3364009-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleduleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeeutdekteffiefhudfffeelhfehleeftdehuefhiefgudelfefgffefudeivddujeenucffohhmrghinhepphgrthgthhgvfidrohhrghenucfkphepudejiedrudegjedrudeghedrgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejiedrudegjedrudeghedrgeegpdhhvghloheplgduledvrdduieekrddurdduheelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopeigihgrohhlvghirdifrghnghesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovhesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgesihhnthgvlhdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:45:39 +0000
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

Hi Xiaolei,


On 8/27/25 10:45, Xiaolei Wang wrote:
> Commit 66671944e176 ("drm/tests: helpers: Add atomic helpers")
> added the atomic state path, so adding the drm connector
> atomic_[duplicate/destroy]_state is also necessary.
>
> WARNING: CPU: 0 PID: 96 at drivers/gpu/drm/drm_connector.c:234 drm_connector_init_only+0x934/0xee0
>   Call trace:
>    drm_connector_init_only+0x934/0xee0 (P)
>    drmm_connector_init+0xe0/0x1b0
>    drm_client_modeset_test_init+0x290/0x534
>    kunit_try_run_case+0x110/0x3b4
>    kunit_generic_run_threadfn_adapter+0x80/0xec
>    kthread+0x3b8/0x6c0
>    ret_from_fork+0x10/0x20
>
> Fixes: 66671944e176 ("drm/tests: helpers: Add atomic helpers")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>
> v1: https://patchew.org/linux/20250811063403.98739-1-xiaolei.wang@windriver.com/
>
> v2: compared with v1, add Fixes tag
>
>   drivers/gpu/drm/tests/drm_client_modeset_test.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> index 3f44fe5e92e4..e702a27c2368 100644
> --- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
> +++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> @@ -12,6 +12,7 @@
>   #include <drm/drm_modes.h>
>   #include <drm/drm_modeset_helper_vtables.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_atomic_state_helper.h>
>   
>   struct drm_client_modeset_test_priv {
>   	struct drm_device *drm;
> @@ -48,6 +49,9 @@ static const struct drm_connector_helper_funcs drm_client_modeset_connector_help
>   };
>   
>   static const struct drm_connector_funcs drm_client_modeset_connector_funcs = {
> +	.reset                  = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
>   };
>   
>   static int drm_client_modeset_test_init(struct kunit *test)


Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

