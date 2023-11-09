Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40317E659E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 09:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5330510E1EB;
	Thu,  9 Nov 2023 08:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 9.mo583.mail-out.ovh.net (9.mo583.mail-out.ovh.net
 [178.32.96.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88BD10E1F8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 08:50:47 +0000 (UTC)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.156.60])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 0037629712
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 08:43:51 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-v4d2x (unknown [10.110.171.163])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3B4F01FE30;
 Thu,  9 Nov 2023 08:43:51 +0000 (UTC)
Received: from RCM-web5.webmail.mail.ovh.net ([51.255.71.60])
 by ghost-submission-6684bf9d7b-v4d2x with ESMTPSA
 id xetbDMebTGXnFgAAqsDEaA
 (envelope-from <jose.pekkarinen@foxhound.fi>); Thu, 09 Nov 2023 08:43:51 +0000
MIME-Version: 1.0
Date: Thu, 09 Nov 2023 10:43:50 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drm/amd/pm: replace 1-element arrays with flexible-array
 members
In-Reply-To: <2023110835-magnolia-prune-02d0@gregkh>
References: <20231108065436.13969-1-jose.pekkarinen@foxhound.fi>
 <2023110835-magnolia-prune-02d0@gregkh>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <1b20f2e4ddc0b0e94aa9a1f9c76ff75c@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.220.102.8
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11224940598066063041
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddvtddguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepheeiudelueefgefgueehgfeukeejgedthedufedvudetfeduveekleefudehjedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudekhedrvddvtddruddtvddrkedphedurddvheehrdejuddriedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, alexander.deucher@amd.com, evan.quan@amd.com,
 christian.koenig@amd.com, linux-kernel-mentees@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-11-08 09:29, Greg KH wrote:
> On Wed, Nov 08, 2023 at 08:54:35AM +0200, José Pekkarinen wrote:
>> The following case seems to be safe to be replaced with a flexible 
>> array
>> to clean up the added coccinelle warning. This patch will just do it.
>> 
>> drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h:76:38-63: 
>> WARNING use flexible-array member instead 
>> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
>> 
>> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>> ---
>>  drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h 
>> b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
>> index c7b61222d258..1ce4087005f0 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
>> @@ -73,7 +73,7 @@ struct smu8_register_index_data_pair {
>> 
>>  struct smu8_ih_meta_data {
>>  	uint32_t command;
>> -	struct smu8_register_index_data_pair register_index_value_pair[1];
>> +	struct smu8_register_index_data_pair register_index_value_pair[];
> 
> Did you just change this structure size without any need to change any
> code as well?  How was this tested?

     I didn't find any use of that struct member, if I missed
something here, please let me know and I'll happily address any
needed further work.

     José.
