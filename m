Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E76D27DCD8E
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1BA10E4B8;
	Tue, 31 Oct 2023 13:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2371 seconds by postgrey-1.36 at gabe;
 Tue, 31 Oct 2023 13:11:38 UTC
Received: from 7.mo576.mail-out.ovh.net (7.mo576.mail-out.ovh.net
 [46.105.50.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F9E10E4B4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 13:11:38 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.1.181])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 6C49629407
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 12:32:05 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-wdl7v (unknown [10.110.103.4])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C15581FE98;
 Tue, 31 Oct 2023 12:32:04 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net ([151.80.29.21])
 by ghost-submission-6684bf9d7b-wdl7v with ESMTPSA
 id WQlLKsTzQGWB1AAAnh/Cbw
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 31 Oct 2023 12:32:04 +0000
MIME-Version: 1.0
Date: Tue, 31 Oct 2023 14:32:02 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drm/amd/display: remove redundant check
In-Reply-To: <2023103141-clear-scale-897a@gregkh>
References: <20231030171748.35482-1-jose.pekkarinen@foxhound.fi>
 <2023103115-obstruct-smudgy-6cc6@gregkh>
 <3ab58c1e48447798d7525e7d2f42f1a2@foxhound.fi>
 <2023103141-clear-scale-897a@gregkh>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <1175edcbdf0d0a55d39a87f220259528@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 213.216.208.215
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17565445922061264391
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtvddggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeeihfevgfduveejjefgffehkeduhfejteegieejheetgedvleetlefguddukeefleenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupddvudefrddvudeirddvtdekrddvudehpdduhedurdektddrvdelrddvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
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
 linux-kernel-mentees@lists.linuxfoundation.org, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 aurabindo.pillai@amd.com, samson.tam@amd.com, skhan@linuxfoundation.org,
 SyedSaaem.Rizvi@amd.com, stable@vger.kernel.org, Jun.Lei@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-31 14:20, Greg KH wrote:
> On Tue, Oct 31, 2023 at 01:42:17PM +0200, José Pekkarinen wrote:
>> On 2023-10-31 07:48, Greg KH wrote:
>> > On Mon, Oct 30, 2023 at 07:17:48PM +0200, José Pekkarinen wrote:
>> > > This patch addresses the following warning spotted by
>> > > using coccinelle where the case checked does the same
>> > > than the else case.
>> > >
>> > > drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c:4664:8-10:
>> > > WARNING: possible condition with no effect (if == else)
>> > >
>> > > Fixes: 974ce181 ("drm/amd/display: Add check for PState change in
>> > > DCN32")
>> > >
>> > > Cc: stable@vger.kernel.org
>> >
>> > Why is this relevant for stable?
>> 
>>     Hi,
>> 
>>     I was asked to send it for stable because this code
>> looks different in amd-staging-drm-next, see here.
>> 
>> https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c#L4661
> 
> I don't know what I am looking at, sorry.
> 
>>     Feel free to let me know if this is wrong, or if I
>> need to review some other guidelines I may have missed.
> 
> Please see the list of rules for stable patches:
>     
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> 
> Does "remove code that does nothing" fit here?

     Yep, it is a trivial fix which compilers should be able
to optimize, so no real benefit to the user. Sorry Greg!

     José.
