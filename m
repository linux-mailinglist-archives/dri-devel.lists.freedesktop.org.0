Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF96936C1C1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581C2899B3;
	Tue, 27 Apr 2021 09:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F3E899B3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 09:32:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCC9C61176;
 Tue, 27 Apr 2021 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1619515935;
 bh=Rbgd9ScvUHvVNgBxoJ/euzCu2miLQ8d0BwdzOdMWw6U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sW0mGt+3GRdyqud1tHJRxYyaMv5pikyhb4v7forC4LGiQ1P83v8XR88ElKxtaNtk7
 34TSWayASDKBiitd+3v+u/npRqb6xzfOIkKOSuCb4g8/st58TmqoQy5qcxVOvIbWKu
 sFZPd5XcQrj1J1qZvXPebp2fCFuq5awYbVMVUzdU=
Date: Tue, 27 Apr 2021 11:31:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/57] Rid W=1 warnings from Staging
Message-ID: <YIfZ4Ad6FxVDtqt/@kroah.com>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
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
Cc: Michael Straube <straube.linux@gmail.com>,
 "John B. Wyatt IV" <jbwyatt4@gmail.com>, linux-iio@vger.kernel.org,
 karthik alapati <mail@karthek.com>,
 Anders Blomdell <anders.blomdell@control.lth.se>,
 dri-devel@lists.freedesktop.org, Marc Dietrich <marvin24@gmx.de>,
 Pierre-Hugues Husson <phhusson@free.fr>,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@protonmail.com>,
 Joel Fernandes <joel@joelfernandes.org>, ac100@lists.launchpad.net,
 Andrey Shvetsov <andrey.shvetsov@k2l.de>,
 Mori Hess <fmhess@users.sourceforge.net>, Martijn Coenen <maco@android.com>,
 linux-staging@lists.linux.dev, Klaas.Gadeyne@mech.kuleuven.ac.be,
 Comedi <comedi@comedi.org>, Stanley@bb.sd3,
 "J.P. Mellor" <jpmellor@rose-hulman.edu>,
 Christian Brauner <christian@brauner.io>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Herman.Bruyninckx@mech.kuleuven.ac.be, Ross Schmidt <ross.schm.dev@gmail.com>,
 Marco Cesati <marcocesati@gmail.com>, linux-pwm@vger.kernel.org,
 Robert Love <rlove@google.com>, Todd Kjos <tkjos@android.com>,
 Kees Cook <keescook@chromium.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Andres Klode <jak@jak-linux.org>, Kernel Team <ac100@lists.lauchpad.net>,
 "David A. Schleef" <ds@schleef.org>, Fabio Aiuto <fabioaiuto83@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>, Ian Abbott <abbotti@mev.co.uk>,
 "Spencer E. Olson" <olsonse@umich.edu>, linux-fbdev@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Wim.Meeussen@mech.kuleuven.ac.be, Allen Pais <apais@linux.microsoft.com>,
 Jacob Feder <jacobsfeder@gmail.com>, Teddy Wang <teddy.wang@siliconmotion.com>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Peter Hurley <peter@hurleysoftware.com>,
 Andrea Merello <andrea.merello@gmail.com>, Truxton Fulton <trux@truxton.com>,
 linux-kernel@vger.kernel.org, Ilya Petrov <ilya.muromec@gmail.com>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Forest Bond <forest@alittletooquiet.net>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Hridya Valsaraju <hridya@google.com>, Jerry chuang <wlanfae@realtek.com>,
 Romain Perier <romain.perier@gmail.com>,
 Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 07:10:32PM +0100, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> Lee Jones (57):

44 of these applied to my tree, I'll keep them in my "testing" branch
for now until -rc1 comes out.  Feel free to rebase your series on that
and fix up the remaining ones and resend.

Note, the comedi drivers have moved to drivers/comedi/ so those patches
need to be sent as a different series, if you still want to make those
changes based on the review comments.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
