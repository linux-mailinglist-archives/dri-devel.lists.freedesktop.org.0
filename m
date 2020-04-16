Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EACEC1AD694
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01546E366;
	Fri, 17 Apr 2020 06:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EFE6EA38
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 18:05:38 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id j4so22259786qkc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 11:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Fftro3jZbixsL8aeMcmWYxRlcOZc1xYOuCyBw47w/C8=;
 b=Nl5IfyW61dNBvqPmzCjDg2WCgVKn+WFlEvYzGa2/Vrnc/VsdQvuSMtSJLw96V+j4cv
 dejqS2JY8YzSiyRBlm/hUKJgwK0Tzom0hkNIV5ncn9tn6oI8GL9vvyOSS+TwwBl3sWr6
 eB1vfy9a/ugWT7bvmGZ8rswnhmYtjyiewE66r/iz8C0/ifJemhTzwk37NhpK5HVa2mGC
 mct5lE9F2dC0DGY9hSdmw0pKAAp++x4KY85qRRtX7ytHUbEKeNAyxdXTsiSKdER8zo9l
 mDhbSmRmNGo36pfEh+D9rtGp/tvR2jQxxDtegfyWmsNeEflc3I7b5Hqfkgt66pgB08TY
 cBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Fftro3jZbixsL8aeMcmWYxRlcOZc1xYOuCyBw47w/C8=;
 b=ViRzUG3srs5j3/hbhWuoYC7OrLzhK0l8Wca+wg8SpVd7F0TohLS+KI528fGJFxSIyd
 sQjca0CdsvzWMJdn557sn3NVMOrnTGIlndxMuXFB00dgZhs/ER54LbndVWljQv7j55Ac
 W2gYY+uJGOhqIRXgkmh1mZmqQqmNlYOHynzyRN5rKu5BPykZZ2/w1ZvWm9Eai+9XeC4B
 V2S74fuIBr5DThkF0oTJtTUJTqlysKYVK9C5sRqmDfQNaQHX7Zxps5HYRQipqJpcxRri
 io6Ypb3Wt/HpHNTrRVer72wEzg0DsnaVjzri/PE8Adec0vnbEhV7zaIREjzAgqjfkv9z
 LyyA==
X-Gm-Message-State: AGi0Pubt6Yhos+C3uiozYzDnc/DeGPyyaV5O2YhvkhfGX46GkvBhQCj+
 jUMuR2ytyWFVEr8BTeVm6T7wZQ==
X-Google-Smtp-Source: APiQypJriZ2ts89EQA9ZmbRGIKxW4OALaXNJVu4hOm4BVdrkDvh3k+fSMcXaWS8jrdSR/LMHDO1tYg==
X-Received: by 2002:a37:8741:: with SMTP id j62mr30990828qkd.441.1587060337403; 
 Thu, 16 Apr 2020 11:05:37 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id n185sm6205781qke.82.2020.04.16.11.05.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 Apr 2020 11:05:36 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jP8tM-00069t-Dc; Thu, 16 Apr 2020 15:05:36 -0300
Date: Thu, 16 Apr 2020 15:05:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
Message-ID: <20200416180536.GW5100@ziepe.ca>
References: <20200414152312.GF5100@ziepe.ca>
 <CAK8P3a1PjP9_b5NdmqTLeGN4y+3JXx_yyTE8YAf1u5rYHWPA9g@mail.gmail.com>
 <f6d83b08fc0bc171b5ba5b2a0bc138727d92e2c0.camel@mellanox.com>
 <CAK8P3a1-J=4EAxh7TtQxugxwXk239u8ffgxZNRdw_WWy8ExFoQ@mail.gmail.com>
 <834c7606743424c64951dd2193ca15e29799bf18.camel@mellanox.com>
 <CAK8P3a3Wx5_bUOKnN3_hG5nLOqv3WCUtMSq6vOkJzWZgsmAz+A@mail.gmail.com>
 <874ktj4tvn.fsf@intel.com>
 <CAK8P3a1S2x1jnx9Q5B22vX8gBHs0Ztu-znA9hqZ5xp5tRAykGg@mail.gmail.com>
 <20200416145235.GR5100@ziepe.ca>
 <CAK8P3a3HwFYKfZftm2fWE=Lzi486rXpMBwjy1F4oohYU2+o7-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3HwFYKfZftm2fWE=Lzi486rXpMBwjy1F4oohYU2+o7-g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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
Cc: "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "leon@kernel.org" <leon@kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>,
 "nico@fluxnic.net" <nico@fluxnic.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Saeed Mahameed <saeedm@mellanox.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 05:58:31PM +0200, Arnd Bergmann wrote:
> On Thu, Apr 16, 2020 at 4:52 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Thu, Apr 16, 2020 at 02:38:50PM +0200, Arnd Bergmann wrote:
> > > On Thu, Apr 16, 2020 at 12:17 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > > > Of course, this is all just talk until someone(tm) posts a patch
> > > > actually making the change. I've looked at the kconfig tool sources
> > > > before; not going to make the same mistake again.
> > >
> > > Right. OTOH whoever implements it gets to pick the color of the
> > > bikeshed. ;-)
> >
> > I hope someone takes it up, especially now that imply, which
> > apparently used to do this, doesn't any more :)
> 
> The old 'imply' was something completely different, it was more of a
> 'try to select if you can so we can assume it's there, but give up
> if it can only be a module and we need it to be built-in".

But it seems to have done this as a side-effect, and drivers were
relying on that, otherwise this series wouldn't exist..

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
