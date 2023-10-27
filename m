Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0462C7D8D37
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 04:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B238810E030;
	Fri, 27 Oct 2023 02:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9888A10E030
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 02:43:38 +0000 (UTC)
X-UUID: e3ade452841d40eba156ba9b12063c01-20231027
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:85ed7e5a-3e71-4548-95cc-e239cd42330d, IP:10,
 URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:-10
X-CID-INFO: VERSION:1.1.32, REQID:85ed7e5a-3e71-4548-95cc-e239cd42330d, IP:10,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-10
X-CID-META: VersionHash:5f78ec9, CLOUDID:5314d4fb-4a48-46e2-b946-12f04f20af8c,
 B
 ulkID:23102710433067VY2P35,BulkQuantity:0,Recheck:0,SF:38|24|17|19|44|64|6
 6|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil
 ,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: e3ade452841d40eba156ba9b12063c01-20231027
X-User: chentao@kylinos.cn
Received: from [172.21.13.26] [(116.128.244.171)] by mailgw
 (envelope-from <chentao@kylinos.cn>) (Generic MTA)
 with ESMTP id 240269613; Fri, 27 Oct 2023 10:43:27 +0800
Message-ID: <6232bb2c-d0b6-4b54-bf29-6f8611542e89@kylinos.cn>
Date: Fri, 27 Oct 2023 10:43:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/atomic: Spelling fix in comments
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20231025082634.34038-1-chentao@kylinos.cn>
 <d4ebae36-265b-4537-ac1b-ae878d236151@amd.com>
From: Kunwu Chan <chentao@kylinos.cn>
In-Reply-To: <d4ebae36-265b-4537-ac1b-ae878d236151@amd.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kunwu.chan@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hamza,
Thank you very much for your guidance and advice to me, I have revised 
it according to your suggestion.

On 2023/10/25 22:50, Hamza Mahfooz wrote:
> Hi Kunwu,
> 
> Can you make the tagline something along the lines of `drm/atomic
> helper: fix spelling mistake "preceeding" -> "preceding"`, in general to
> determine an appropriate prefix, you can see what previous commits used
> when making changes to files in your particular patch, e.g. using the
> following:
> 
> $ git log drivers/gpu/drm/drm_atomic_helper.c
> On 10/25/23 04:26, Kunwu Chan wrote:
>> fix a typo in a comments.
> 
> For patch descriptions you should try to more descriptive.
> 
> So, something like "There is a spelling mistake in
> drm_atomic_helper_wait_for_dependencies()'s kernel doc. Fix it." would
> be better.
> 
>>
>> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
>> ---
>>   drivers/gpu/drm/drm_atomic_helper.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c 
>> b/drivers/gpu/drm/drm_atomic_helper.c
>> index 2444fc33dd7c..c3f677130def 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -2382,10 +2382,10 @@ int drm_atomic_helper_setup_commit(struct 
>> drm_atomic_state *state,
>>   EXPORT_SYMBOL(drm_atomic_helper_setup_commit);
>>   /**
>> - * drm_atomic_helper_wait_for_dependencies - wait for required 
>> preceeding commits
>> + * drm_atomic_helper_wait_for_dependencies - wait for required 
>> preceding commits
>>    * @old_state: atomic state object with old state structures
>>    *
>> - * This function waits for all preceeding commits that touch the same 
>> CRTC as
>> + * This function waits for all preceding commits that touch the same 
>> CRTC as
>>    * @old_state to both be committed to the hardware (as signalled by
>>    * drm_atomic_helper_commit_hw_done()) and executed by the hardware 
>> (as signalled
>>    * by calling drm_crtc_send_vblank_event() on the 
>> &drm_crtc_state.event).
