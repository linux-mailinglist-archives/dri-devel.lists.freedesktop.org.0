Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FAA7D2B7C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 09:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B4910E155;
	Mon, 23 Oct 2023 07:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1800 seconds by postgrey-1.36 at gabe;
 Sun, 22 Oct 2023 23:29:47 UTC
Received: from purple.birch.relay.mailchannels.net
 (purple.birch.relay.mailchannels.net [23.83.209.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B810510E02F
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 23:29:47 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|x.reply@epreston.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 888EA6C147F;
 Sun, 22 Oct 2023 22:54:08 +0000 (UTC)
Received: from s147.servername.online (unknown [127.0.0.6])
 (Authenticated sender: hostpapa)
 by relay.mailchannels.net (Postfix) with ESMTPA id C958A6C14FE;
 Sun, 22 Oct 2023 22:54:07 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1698015248; a=rsa-sha256;
 cv=none;
 b=p1XSiuDfEGfFFe133Drjv75NmISP3m2xKtSYnEKxA9QAZ6eo+RU/A2Ir8KRxVQNc6G22Gx
 574elESDREfq//cB5VLr1Gfqzv1oguiWdh2fucFdiERCACNp1gCk8ixSQiSKqpS9sD/E6V
 UvOfS6oFWt4XMUpBFCOAxouhW8fsDdsQKw8yuV0bvXYrbrzUruM20v3a2IyrWibLR7zvWB
 eCgSePRcc1UwpeBf20F5Z52QcMIcn2TAVMvKcZH9LQ6sBY2jtczfSlQZX5IJ/Dcg7+R0jD
 EmucH1FfHchVoVvXSDRFq6WIetLvTyqWfT3mcgsTNdyKmBzdoi4GvkulXUPoSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1698015248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=gDWtLghsWx6nnjrewvz+iHsajZfjSscfDKYT9XWGKC4=;
 b=N77UMFFiUqGn7YwdJM1eTxCeWT+Nxq/6oHAn0YTsvlDHPQEy0cZ8ghvrTVZaKEaz58iEg5
 hjfH+7kQS6exB5shNst6o0wtUsueBlTyIh9YKLO1+L+rwIi1PNtYfAwwIsrSYPQu2Vf1Uk
 kjuKkLISt2/yQ2YDJuL4NraPudTqdk84OmgTrXNGnHcf3xZMtb1lW8BeMNHZoghXztFUnx
 17BGigJIhP0iIBBUdsEfNBJ1oIjX3axFnaVw1oIleEMeet+p8RquVnfedEtYgdc2pLlzC4
 xfWojJyAkMPldM/3UjMYAkFN1E4RFSsNDNc+p3kbH5yuqnqthWk7/jS4Drk0eQ==
ARC-Authentication-Results: i=1; rspamd-846f4b758b-nczqm;
 auth=pass smtp.auth=hostpapa smtp.mailfrom=x.arch@epreston.net
X-Sender-Id: hostpapa|x-authuser|x.reply@epreston.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|x.reply@epreston.net
X-MailChannels-Auth-Id: hostpapa
X-Share-Unite: 72aad6c35d547ad4_1698015248342_2281811999
X-MC-Loop-Signature: 1698015248342:1735253197
X-MC-Ingress-Time: 1698015248342
Received: from s147.servername.online (s147.servername.online [204.44.192.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
 by 100.101.178.134 (trex/6.9.2); Sun, 22 Oct 2023 22:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=epreston.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gDWtLghsWx6nnjrewvz+iHsajZfjSscfDKYT9XWGKC4=; b=Ta90tR8fH+Hn0FFKu0Klb+TL/0
 2md2e0S2BvJ/k5oyLoQ0rGdYeEY02Mx1sWL2FCOchqFntR/rhP0mirFaj/GAs/2wtlGe/SwyAjgeF
 ut8oso2MupsKV49YQ5tzdge0cIGO93h6m2/HKPcAC1lwMfJsPbeeZCc6kgapZ9vuPCKXV61uiFxpI
 5i5fB98KdSZHWj0YQjOIvzzwuu5N9IPVYGIphI549lQqhdDSz0Llmg9xHHHhE6SmnhzoddNr/sPhd
 nLDlWnp2gN4+h4RJJb3mO6Mdt2lD4ninByZqRx7dF2x5RnkjB/yPJcPejk2ltXkWRc0dlNig9FSjs
 jliRyrkw==;
Received: from [50.35.115.28] (port=46014 helo=P70.localdomain)
 by s147.servername.online with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <x.arch@epreston.net>) id 1quhKf-0009tT-2z;
 Sun, 22 Oct 2023 15:54:07 -0700
Date: Sun, 22 Oct 2023 15:54:05 -0700
From: Evan Preston <x.arch@epreston.net>
To: Huacai Chen <chenhuacai@kernel.org>
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
Message-ID: <ZTWoDSPxGO-ApR4r@P70.localdomain>
References: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
 <31bdf7b1-0ed9-4217-b459-1d857e53120b@leemhuis.info>
 <CAAhV-H7fRpykesVUEyaTpVnFiGwpP+fPbtdrp6JwfgD=bDp06Q@mail.gmail.com>
 <CAAhV-H7XCmbgS=N4-SE8FnASAws8hnDRZsQJgXE+dwyARaqzNw@mail.gmail.com>
 <ZSO9uArAtsPMPeTP@debian.me>
 <CAAhV-H5GbidUx8YanUc7S9oGqBkDd53xeT=2O4aCuX7KpM-+8A@mail.gmail.com>
 <c9b79a69-bdc1-4457-900d-709a15d99568@leemhuis.info>
 <CAAhV-H4qQW_fOdkTxmT1xbvo4LOapzw_tOw7Kma47xmh0PvpPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H4qQW_fOdkTxmT1xbvo4LOapzw_tOw7Kma47xmh0PvpPA@mail.gmail.com>
X-AuthUser: x.reply@epreston.net
X-Mailman-Approved-At: Mon, 23 Oct 2023 07:38:06 +0000
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jaak Ristioja <jaak@ristioja.ee>, Bagas Sanjaya <bagasdotme@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-20 Fri 05:48pm, Huacai Chen wrote:
> On Fri, Oct 20, 2023 at 5:35 PM Linux regression tracking (Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
> >
> > On 09.10.23 10:54, Huacai Chen wrote:
> > > On Mon, Oct 9, 2023 at 4:45 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> > >> On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Chen wrote:
> > >>> On Tue, Sep 26, 2023 at 10:31 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> > >>>> On Tue, Sep 26, 2023 at 7:15 PM Linux regression tracking (Thorsten
> > >>>> Leemhuis) <regressions@leemhuis.info> wrote:
> > >>>>> On 13.09.23 14:02, Jaak Ristioja wrote:
> > >>>>>>
> > >>>>>> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated Intel HD
> > >>>>>> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a blank
> > >>>>>> screen after boot until the display manager starts... if it does start
> > >>>>>> at all. Using the nomodeset kernel parameter seems to be a workaround.
> > >>>>>>
> > >>>>>> I've bisected this to commit 60aebc9559492cea6a9625f514a8041717e3a2e4
> > >>>>>> ("drivers/firmware: Move sysfb_init() from device_initcall to
> > >>>>>> subsys_initcall_sync").
> > >>>>>
> > >>>>> Hmmm, no reaction since it was posted a while ago, unless I'm missing
> > >>>>> something.
> > >>>>>
> > >>>>> Huacai Chen, did you maybe miss this report? The problem is apparently
> > >>>>> caused by a commit of yours (that Javier applied), you hence should look
> > >>>>> into this.
> > >>>> I'm sorry but it looks very strange, could you please share your config file?
> > >>> As confirmed by Jaak, disabling DRM_SIMPLEDRM makes things work fine
> > >>> again. So I guess the reason:
> > >>
> > >> Did Jaak reply privately? It should have been disclosed in public
> > >> ML here instead.
> > > Yes, he replied privately, and disabling DRM_SIMPLEDRM was suggested by me.
> >
> > Well, this to me still looks a lot (please correct me if I'm wrong) like
> > regression that should be fixed, as DRM_SIMPLEDRM was enabled beforehand
> > if I understood things correctly. Or is there a proper fix for this
> > already in the works and I just missed this? Or is there some good
> > reason why this won't/can't be fixed?
> DRM_SIMPLEDRM was enabled but it didn't work at all because there was
> no corresponding platform device. Now DRM_SIMPLEDRM works but it has a
> blank screen. Of course it is valuable to investigate further about
> DRM_SIMPLEDRM on Jaak's machine, but that needs Jaak's effort because
> I don't have a same machine.
> 
> Huacai

I am having the same issue on a Lenovo Thinkpad P70 (Intel Corporation HD Graphics 530 (rev 06), Intel(R) Core(TM) i7-6700HQ).  Upgrading from Linux 6.4.12 to 6.5 and later results in only a blank screen after boot and a rapidly flashing device-access-status indicator.

> >
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> > --
> > Everything you wanna know about Linux kernel regression tracking:
> > https://linux-regtracking.leemhuis.info/about/#tldr
> > If I did something stupid, please tell me, as explained on that page.
> >
> > #regzbot poke
> >
> > >>> When SIMPLEDRM takes over the framebuffer, the screen is blank (don't
> > >>> know why). And before 60aebc9559492cea6a9625f ("drivers/firmware: Move
> > >>> sysfb_init() from device_initcall to subsys_initcall_sync") there is
> > >>> no platform device created for SIMPLEDRM at early stage, so it seems
> > >>> also "no problem".
> > >>
> > >> I don't understand above. You mean that after that commit the platform
> > >> device is also none, right?
> > > No. The SIMPLEDRM driver needs a platform device to work, and that
> > > commit makes the platform device created earlier. So, before that
> > > commit, SIMPLEDRM doesn't work, but the screen isn't blank; after that
> > > commit, SIMPLEDRM works, but the screen is blank.
> > >
> > > Huacai
> > >>
> > >> Confused...
> > >>
> > >> --
> > >> An old man doll... just what I always wanted! - Clara
> > >
> > >
