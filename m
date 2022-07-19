Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B843579504
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 10:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A720611A38C;
	Tue, 19 Jul 2022 08:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830CB11A395;
 Tue, 19 Jul 2022 08:11:41 +0000 (UTC)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
 (envelope-from <dri-devel-bounces@lists.sourceforge.net>)
 id 1oDiKR-0007po-Jx; Tue, 19 Jul 2022 08:11:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <airlied@gmail.com>) id 1oDbBd-0006qz-3D
 for dri-devel@lists.sourceforge.net; Tue, 19 Jul 2022 00:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IvxZ+pT9eeB1oLC9gFmEKd/KuQtpynmxv5JFp2p4LmA=; b=dQZull4rUiMNTqn0IUuW3OGn2b
 7KynH7EPAndatViJmnuzEW+7uOr35jRfZ+uqW/5ZhTBqxQZRdwyQtWfYYrtX+cFvjpG7iJz5vg7j6
 3OI1CkLmg3z5qVxr/IYW5WzJP6j09RxIddb2oc/funD3LFZL3I58qnCOG+R0N9AHVwRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IvxZ+pT9eeB1oLC9gFmEKd/KuQtpynmxv5JFp2p4LmA=; b=f2EHcfisPfK++zz+IpxBd8jYJX
 BrQ/Ou9xdBth6JV31n91cK+25owUJ5NnzrB12z2jfHnGAKVE6FeyjUb5odEPAliXY1l8CrdX3hmLq
 rMROPxpF0zztRQq9oGZFEdKm2DEHTymAmp6mdHdC3EXXPSdcDq2cNfme+h1IEKgdFZPY=;
Received: from mail-ej1-f51.google.com ([209.85.218.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oDbBb-003T8P-64
 for dri-devel@lists.sourceforge.net; Tue, 19 Jul 2022 00:34:03 +0000
Received: by mail-ej1-f51.google.com with SMTP id ss3so24279924ejc.11
 for <dri-devel@lists.sf.net>; Mon, 18 Jul 2022 17:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112; 
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IvxZ+pT9eeB1oLC9gFmEKd/KuQtpynmxv5JFp2p4LmA=;
 b=gIwUl/XuJhRTTGvtNQ0aWFNNZ72RlbJkwCpGM7wO/sSbDoqxUvqlBJWjDWb4nUVxkr
 wA4kzWGIsYd+oyTYPVOyC2ZEirNy56kC6YvoOg+Fu9JlIyx/BhzBlvQ+GB0MbVTk2jEb
 eyBlXAwQJroWvaq2gnY/J8A7Jy+02RK/TtexgA7MBUZK9FnxBH7HPm/OPbZR2kp6FIOG
 BYDIh26pR+njlg0wqOtuaPaePG5L+WBmSIyBqxyMD5dCULrXaEhs9vg/GnJqlYLpsG/y
 w38dp1uD5s55WeggWwrAh2xQxeFiYqJgAS/5mGamYHgRw4gT0je1cudllgWrZEayUSK0
 E39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IvxZ+pT9eeB1oLC9gFmEKd/KuQtpynmxv5JFp2p4LmA=;
 b=KaKNgNSi6zlNYGW8fubVm7oqS2HutJnYdP7L9m6vtKJLrBWBE4aQbQ5E+EtIqWE4g0
 jNHENNjj1tjwGe4KKmMm8DKVQYUxlYU3jlg91KpMeg8+iBrByMiPQQS3pulXq1DyzdqD
 oVLIfUbDdBvdGKj3VL9/mxe/r+45bUtqavcX47ZBOc6flkDXInEZUAEJ0nXGCqYr+azk
 ujFuXr3NHIqD51WZNLTAoCwzoyENITL8sfwGHMy018pvsZoGSGRqKi5k4n6s5uTgV3U6
 pyRX/K1Xdxz9+iQPMHhJ+uZNPZ/CdYHf+XIZSFKCKbKecoaj3AB0zSLzrXL5BBIrOihb
 BBbQ==
X-Gm-Message-State: AJIora+kvhcbDlGFJg+MunviV/gumDKsthMwwCxRZKTsht9yWT6HEhy8
 9jcnlGF90E93mp0cyg9Ag6QBVJCUhwStTk8ecsgZZgX4EQs=
X-Google-Smtp-Source: AGRyM1sRm67nRsWZfFSFhouVBqucc4bOtFjiV6na1gILOaBHlxhxwORoLOL7DxP/wH7oPhk7TCfa/L42Gn4aM8oO2I8=
X-Received: by 2002:a17:906:149:b0:712:502:bc62 with SMTP id
 9-20020a170906014900b007120502bc62mr28280283ejh.720.1658190836834; Mon, 18
 Jul 2022 17:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220718072144.2699487-1-airlied@gmail.com>
 <97e5afd3-77a3-2227-0fbf-da2f9a41520f@leemhuis.info>
 <20220718150414.1767bbd8@kernel.org>
In-Reply-To: <20220718150414.1767bbd8@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 19 Jul 2022 10:33:45 +1000
Message-ID: <CAPM=9tw6iP3Ti1idrBLTLVX57uYgf79rG2-0ad-fS48z+pXzeA@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: firmware: add driver firmware
 guidelines.
To: Jakub Kicinski <kuba@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 19 Jul 2022 at 08:04, Jakub Kicinski wrote: > > On
 Mon, 18 Jul 2022 11:33:11 +0200 Thorsten Leemhuis wrote: > > > If the hardware
 isn't > > > + enabled by default or under development, > > > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [airlied[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.51 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.51 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oDbBb-003T8P-64
X-Mailman-Approved-At: Tue, 19 Jul 2022 08:11:34 +0000
X-BeenThere: dri-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Wireless List <linux-wireless@vger.kernel.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, LKML <linux-kernel@vger.kernel.org>,
 linux-block@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 "dri-devel@lists.sf.net" <dri-devel@lists.sf.net>,
 Dave Airlie <airlied@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Jul 2022 at 08:04, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Mon, 18 Jul 2022 11:33:11 +0200 Thorsten Leemhuis wrote:
> > > If the hardware isn't
> > > +  enabled by default or under development,
> >
> > Wondering if it might be better to drop the "or under development", as
> > the "enabled by default" is the main part afaics. Maybe something like
> > "If support for the hardware is normally inactive (e.g. has to be
> > enabled manually by a kernel parameter)" would be better anyway.
>
> It's a tricky one, I'd say something like you can break the FW ABI
> "until HW becomes available for public consumption" or such.
> I'm guessing what we're after is letting people break the compatibility
> in early stages of the product development cycles. Pre-silicon and
> bring up, but not after there are products on the market?

I'll stick with enabled by default I think, "public consumption"
invites efforts to describe corners of the cloud or other places where
hw has shipped but is not technically "public",

Dave.


--
_______________________________________________
Dri-devel mailing list
Dri-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/dri-devel
