Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78161D4C9E
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 13:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B456EC6F;
	Fri, 15 May 2020 11:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052496EC6F;
 Fri, 15 May 2020 11:32:28 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04FBWJTN029039;
 Fri, 15 May 2020 06:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1589542339;
 bh=FBPM0tfxUgFMucOY7ciuW2TKyNmhw7Ptun8SfEM32Yc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yOpRlpg1yqyCCA+cY2AyJMwySObitQn8jVweWkNL4ELVevQBhMk8yXp/XUTZdVJXL
 1pEoHYIA+A3PyqX1kjhRpvTVUxqbShngkBwiGdgzvVvUmzdtyIQ34AMHMdHYQUnzMa
 2TuHg8XxGflf6y7R2u+1bJ7FtvmGiPt40HRv+y6M=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04FBWJBP121748;
 Fri, 15 May 2020 06:32:19 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 May 2020 06:32:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 May 2020 06:32:19 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04FBWGIv063336;
 Fri, 15 May 2020 06:32:17 -0500
Subject: Re: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
References: <20200421115241.704f2fbf@canb.auug.org.au>
 <c299b6d5-a786-1620-2863-8814a1242cf8@ti.com>
 <20200423131727.1e0f2d9f@canb.auug.org.au>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <4b46d98a-e8ca-0140-b082-3af88e1bc1fc@ti.com>
Date: Fri, 15 May 2020 14:32:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423131727.1e0f2d9f@canb.auug.org.au>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On 23/04/2020 06:17, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 21 Apr 2020 09:10:25 +0300 Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>>
>> On 21/04/2020 04:52, Stephen Rothwell wrote:
>>>
>>> Today's linux-next merge of the drm-misc tree got a conflict in:he drm-misc tree with the drm-misc-fixes tree
>>>
>>>     drivers/gpu/drm/tidss/tidss_encoder.c
>>>
>>> between commit:
>>>
>>>     9da67433f64e ("drm/tidss: fix crash related to accessing freed memory")
>>>
>>> from the drm-misc-fixes tree and commit:
>>>
>>>     b28ad7deb2f2 ("drm/tidss: Use simple encoder")
>>>
>>> from the drm-misc tree.
>>>
>>> I fixed it up (I just used the latter version of this file) and can
>>
>> We need to use "drm/tidss: fix crash related to accessing freed memory" version.
>>
>>> carry the fix as necessary. This is now fixed as far as linux-next is
>>> concerned, but any non trivial conflicts should be mentioned to your
>>> upstream maintainer when your tree is submitted for merging.  You may
>>> also want to consider cooperating with the maintainer of the conflicting
>>> tree to minimise any particularly complex conflicts.
>>
>> I have fixed this with drm-misc's dim tool, so I presume the conflict goes away when drm-misc-fixes
>> is merged to drm-fixes, and drm-fixes is then at some point merged to drm-misc-next.
>>
>> It was a bit bad timing with the "drm/tidss: Use simple encoder", which removes the plumbing I
>> needed to implement the fix. So I effectively revert the "drm/tidss: Use simple encoder".
>>
>>    Tomi
>>
> 
> This is now a conflict between the drm and drm-misc-fixes trees.

The fix ("drm/tidss: fix crash related to accessing freed memory") is in v5.7-rc3, and the conflicting change ("drm/tidss: Use simple encoder") in drm-next.

The conflict resolution in linux-next drops the fix and take the change from drm-next, which causes crash on module removal.

Here's the diff I made on top of linux-next to fix it. Essentially dropping the simple-encoder change, and reapplying the fix. This should be fixed in drm-next when Dave next time pulls in Linus' branch.

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 4c0558286f5e..e624cdcbb567 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -56,25 +56,38 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static void tidss_encoder_destroy(struct drm_encoder *encoder)
+{
+	drm_encoder_cleanup(encoder);
+	kfree(encoder);
+}
+
 static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
 	.atomic_check = tidss_encoder_atomic_check,
 };
 
+static const struct drm_encoder_funcs encoder_funcs = {
+	.destroy = tidss_encoder_destroy,
+};
+
 struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
 					 u32 encoder_type, u32 possible_crtcs)
 {
 	struct drm_encoder *enc;
 	int ret;
 
-	enc = devm_kzalloc(tidss->dev, sizeof(*enc), GFP_KERNEL);
+	enc = kzalloc(sizeof(*enc), GFP_KERNEL);
 	if (!enc)
 		return ERR_PTR(-ENOMEM);
 
 	enc->possible_crtcs = possible_crtcs;
 
-	ret = drm_simple_encoder_init(&tidss->ddev, enc, encoder_type);
-	if (ret < 0)
+	ret = drm_encoder_init(&tidss->ddev, enc, &encoder_funcs,
+			       encoder_type, NULL);
+	if (ret < 0) {
+		kfree(enc);
 		return ERR_PTR(ret);
+	}
 
 	drm_encoder_helper_add(enc, &encoder_helper_funcs);
 


 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
