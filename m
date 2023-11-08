Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C747E5233
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 09:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E692710E15B;
	Wed,  8 Nov 2023 08:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 7017 seconds by postgrey-1.36 at gabe;
 Wed, 08 Nov 2023 08:52:47 UTC
Received: from 11.mo582.mail-out.ovh.net (11.mo582.mail-out.ovh.net
 [188.165.38.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3CA10E15B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 08:52:47 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.156.34])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id D6663288D9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 07:36:15 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-k8mr2 (unknown [10.110.103.34])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1CE1B1FE9A;
 Wed,  8 Nov 2023 07:36:15 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net ([151.80.29.21])
 by ghost-submission-6684bf9d7b-k8mr2 with ESMTPSA
 id t3ULBm86S2VjUxQAdDy9bg
 (envelope-from <jose.pekkarinen@foxhound.fi>); Wed, 08 Nov 2023 07:36:15 +0000
MIME-Version: 1.0
Date: Wed, 08 Nov 2023 09:36:14 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: Re: [PATCH] drm/amd/display: remove duplicated argument
In-Reply-To: <d56cd927-49fc-cb4e-8abd-abc539e4d276@amd.com>
References: <20231029093926.137766-1-jose.pekkarinen@foxhound.fi>
 <d56cd927-49fc-cb4e-8abd-abc539e4d276@amd.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <e095fae915d44ccc186d5e5ee74ec119@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.220.101.156
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4210584177794590374
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddukedguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepkefhgeduudefgedvleegtddvffeghedvtdekveekjeevvdegiedtfeelhedtiedtnecukfhppeduvdejrddtrddtrddupddukeehrddvvddtrddutddurdduheeipdduhedurdektddrvdelrddvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
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
Cc: sunran001@208suo.com, sunpeng.li@amd.com, qingqing.zhuo@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Zhongwei.Zhang@amd.com, alex.hung@amd.com,
 Yao.Wang1@amd.com, dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org,
 alexander.deucher@amd.com, Jun.Lei@amd.com, christian.koenig@amd.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-30 15:54, Aurabindo Pillai wrote:
> On 10/29/2023 5:39 AM, José Pekkarinen wrote:
>> Spotted by coccicheck, there is a redundant check for
>> v->SourcePixelFormat[k] != dm_444_16. This patch will
>> remove it. The corresponding output follows.
>> 
>> drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c:5130:86-122: 
>> duplicated argument to && or ||
>> 
>> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>> ---
>>   drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c | 2 
>> +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git 
>> a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c 
>> b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
>> index ad741a723c0e..3686f1e7de3a 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
>> @@ -5128,7 +5128,7 @@ void 
>> dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib 
>> *mode_l
>>   			ViewportExceedsSurface = true;
>>     		if (v->SourcePixelFormat[k] != dm_444_64 && 
>> v->SourcePixelFormat[k] != dm_444_32 && v->SourcePixelFormat[k] != 
>> dm_444_16
>> -				&& v->SourcePixelFormat[k] != dm_444_16 && 
>> v->SourcePixelFormat[k] != dm_444_8 && v->SourcePixelFormat[k] != 
>> dm_rgbe) {
>> +				&& v->SourcePixelFormat[k] != dm_444_8 && v->SourcePixelFormat[k] 
>> != dm_rgbe) {
>>   			if (v->ViewportWidthChroma[k] > v->SurfaceWidthC[k] || 
>> v->ViewportHeightChroma[k] > v->SurfaceHeightC[k]) {
>>   				ViewportExceedsSurface = true;
>>   			}
> 
> Thanks for catching.
> 
> Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

     Sorry to bring this up, I just wanted to check whether this
has been applied in the following pulls or not.

     Thanks!

     José.
