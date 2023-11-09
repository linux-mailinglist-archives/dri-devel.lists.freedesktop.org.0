Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEAB7E6A5F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 13:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2123210E04F;
	Thu,  9 Nov 2023 12:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 10.mo550.mail-out.ovh.net (10.mo550.mail-out.ovh.net
 [178.32.96.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0576010E0EB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 12:14:02 +0000 (UTC)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.20.85])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 7038F241EF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 11:54:09 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-mtzwj (unknown [10.110.115.240])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 85C921FE5E;
 Thu,  9 Nov 2023 11:54:08 +0000 (UTC)
Received: from RCM-web7.webmail.mail.ovh.net ([151.80.29.19])
 by ghost-submission-6684bf9d7b-mtzwj with ESMTPSA
 id RRNyHmDITGUefgQAf8sC0A
 (envelope-from <jose.pekkarinen@foxhound.fi>); Thu, 09 Nov 2023 11:54:08 +0000
MIME-Version: 1.0
Date: Thu, 09 Nov 2023 13:54:07 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drm/amd/pm: replace 1-element arrays with flexible-array
 members
In-Reply-To: <2023110916-tinfoil-concur-77d8@gregkh>
References: <20231108065436.13969-1-jose.pekkarinen@foxhound.fi>
 <2023110835-magnolia-prune-02d0@gregkh>
 <1b20f2e4ddc0b0e94aa9a1f9c76ff75c@foxhound.fi>
 <2023110916-tinfoil-concur-77d8@gregkh>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <ee757d648a601ba3530e0eeb1c5d178e@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 109.70.100.69
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14438821884044027585
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddvuddgfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeehieduleeufeeggfeuhefgueekjeegtdehudefvdduteefudevkeelfeduheejtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupddutdelrdejtddruddttddrieelpdduhedurdektddrvdelrdduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehhedtpdhmohguvgepshhmthhpohhuth
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

On 2023-11-09 11:06, Greg KH wrote:
> On Thu, Nov 09, 2023 at 10:43:50AM +0200, José Pekkarinen wrote:
>> On 2023-11-08 09:29, Greg KH wrote:
>> > On Wed, Nov 08, 2023 at 08:54:35AM +0200, José Pekkarinen wrote:
>> > > The following case seems to be safe to be replaced with a flexible
>> > > array
>> > > to clean up the added coccinelle warning. This patch will just do it.
>> > >
>> > > drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h:76:38-63:
>> > > WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
>> > >
>> > > Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>> > > ---
>> > >  drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h | 2 +-
>> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
>> > > b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
>> > > index c7b61222d258..1ce4087005f0 100644
>> > > --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
>> > > +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
>> > > @@ -73,7 +73,7 @@ struct smu8_register_index_data_pair {
>> > >
>> > >  struct smu8_ih_meta_data {
>> > >  	uint32_t command;
>> > > -	struct smu8_register_index_data_pair register_index_value_pair[1];
>> > > +	struct smu8_register_index_data_pair register_index_value_pair[];
>> >
>> > Did you just change this structure size without any need to change any
>> > code as well?  How was this tested?
>> 
>>     I didn't find any use of that struct member, if I missed
>> something here, please let me know and I'll happily address any
>> needed further work.
> 
> I don't think this is even a variable array.  It's just a one element
> one, which is fine, don't be confused by the coccinelle "warning" here,
> it's fired many false-positives and you need to verify this properly
> with the driver authors first before changing anything.

      My apologies to you, and anybody that feels the same, it is not my
intention to bother with mistaken patches, I just assume that this patch
or any other from me, will go to review process, where it should be fine
if the patch is right, wrong, need further work, or further testing 
either
from my side or anybody else, and at the end of the day I need to do
patches if I want to find my mentorship patches, and graduate.

> In short, you just changed the size of this structure, are you _sure_
> you can do that?  And yes, it doesn't look like this field is used, but
> the structure is, so be careful.

     I don't know, let check it out together and see where this goes.

     José.
