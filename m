Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DA77DBE75
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 18:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DFD10E0F7;
	Mon, 30 Oct 2023 17:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2206 seconds by postgrey-1.36 at gabe;
 Mon, 30 Oct 2023 17:03:24 UTC
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net
 [46.105.63.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0ECD10E0F7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 17:03:24 +0000 (UTC)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.4.60])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id EF27627821
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 16:26:35 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-7hln7 (unknown [10.110.208.67])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 16CAE1FE61;
 Mon, 30 Oct 2023 16:26:35 +0000 (UTC)
Received: from RCM-web3.webmail.mail.ovh.net ([178.33.236.78])
 by ghost-submission-6684bf9d7b-7hln7 with ESMTPSA
 id zBVnAzvZP2VUTQEAW38/SQ
 (envelope-from <jose.pekkarinen@foxhound.fi>); Mon, 30 Oct 2023 16:26:35 +0000
MIME-Version: 1.0
Date: Mon, 30 Oct 2023 18:26:34 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: Re: [PATCH] drm/amd/display: remove redundant check
In-Reply-To: <ce1b69e1-fa38-2e12-1ad5-375ac244af42@amd.com>
References: <20231029124404.16159-1-jose.pekkarinen@foxhound.fi>
 <ce1b69e1-fa38-2e12-1ad5-375ac244af42@amd.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <3c228e4f69c01dddd4743bdb68845566@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 162.247.74.74
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15653104930003855014
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddttddgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeekhfeguddufeegvdelgedtvdffgeehvddtkeevkeejvedvgeeitdefleehtdeitdenucfkphepuddvjedrtddrtddruddpudeivddrvdegjedrjeegrdejgedpudejkedrfeefrddvfeeirdejkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth
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
Cc: dillon.varone@amd.com, george.shen@amd.com, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, samson.tam@amd.com, SyedSaaem.Rizvi@amd.com,
 amd-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 alexander.deucher@amd.com, Jun.Lei@amd.com, christian.koenig@amd.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-30 15:52, Aurabindo Pillai wrote:
> On 10/29/2023 8:44 AM, José Pekkarinen wrote:
>> This patch addresses the following warning spotted by
>> using coccinelle where the case checked does the same
>> than the else case.
>> 
>> drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c:4664:8-10: 
>> WARNING: possible condition with no effect (if == else)
>> 
>> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>> ---
>>   .../drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c   | 4 
>> ----
>>   1 file changed, 4 deletions(-)
>> 
>> diff --git 
>> a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c 
>> b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
>> index ecea008f19d3..d940dfa5ae43 100644
>> --- 
>> a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
>> +++ 
>> b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
>> @@ -4661,10 +4661,6 @@ void dml32_CalculateMinAndMaxPrefetchMode(
>>   	} else if (AllowForPStateChangeOrStutterInVBlankFinal == 
>> dm_prefetch_support_uclk_fclk_and_stutter) {
>>   		*MinPrefetchMode = 0;
>>   		*MaxPrefetchMode = 0;
>> -	} else if (AllowForPStateChangeOrStutterInVBlankFinal ==
>> -			dm_prefetch_support_uclk_fclk_and_stutter_if_possible) {
>> -		*MinPrefetchMode = 0;
>> -		*MaxPrefetchMode = 3;
>>   	} else {
>>   		*MinPrefetchMode = 0;
>>   		*MaxPrefetchMode = 3;
> 
> What tree did you use to generate the patch? On amd-staging-drm-next,
> MaxPrefetchMode is 0 for the second last branch, which is the correct
> one, so this patch isnt needed.

     I'm using the stable tree, sorry, if it is out of
date just ignore it then.

     Thanks!

     José.
