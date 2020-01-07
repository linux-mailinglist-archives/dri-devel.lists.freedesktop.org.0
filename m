Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA7E1327EA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 14:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C9A89AA2;
	Tue,  7 Jan 2020 13:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701E389A4F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 13:40:42 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id i16so50366328edr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 05:40:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=thsd3sinDDhuM6E2t49+n1Gx03E9tay/7z6/ctLyCAs=;
 b=cFA6rKRko8OAoQxr2MDh7RQAhQ/Vk+mL+1K1K3pYrhcrmo6n323e0ZfhbM/3bGECP2
 Tw6MWIGLcWD4B/47pTNyZ9Vx/Wb6pf+lrG7NTN/0JWx16Izfd+vuywM39VmVmjRsPSQL
 l+zIs0qRoOJMpCaxWQtlIwlCoUkTJP8oTU3nmiJO07PfIwVaKlUZoZuhXpHdPJZcqsGP
 6iZDqpKliURDaQjXGoVkj43EbN8+qftpjWTwFpAK8F4i+evJuez1qMe3hje5sLSZWf7Z
 zOUt/QaNPlorgdYnTj96jk2hTRYcOTxW0C/XPkuj95dbFAm6kmcZcUUwGCetsNLW7MrN
 bccQ==
X-Gm-Message-State: APjAAAVZ0qb/E+li+SUWjNH6wGC9VFEhp+QMZpzSu36kv0+MBPlQq60S
 IBOFfC9aqH5ejpnkvAeFP+cmOYIjMew=
X-Google-Smtp-Source: APXvYqzKCOmmOhlcQENX0B/icVJlB5G1hZKbqRLRQWftJsO8PS/0ZpcD9dGF3EnUQPwO5x4uhPPgMw==
X-Received: by 2002:a50:fd93:: with SMTP id o19mr113627000edt.28.1578404440875; 
 Tue, 07 Jan 2020 05:40:40 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51])
 by smtp.gmail.com with ESMTPSA id d8sm7419983edn.52.2020.01.07.05.40.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 05:40:40 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id q9so18989414wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 05:40:40 -0800 (PST)
X-Received: by 2002:a05:600c:2409:: with SMTP id
 9mr37808693wmp.109.1578404439743; 
 Tue, 07 Jan 2020 05:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20191219092000.949052-1-maxime@cerno.tech>
 <20191219092000.949052-2-maxime@cerno.tech>
In-Reply-To: <20191219092000.949052-2-maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 7 Jan 2020 21:40:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v67K7wGEZugdXk3E0naA3Mk-bzkJh_aZT-_FaeQgz4-5eA@mail.gmail.com>
Message-ID: <CAGb2v67K7wGEZugdXk3E0naA3Mk-bzkJh_aZT-_FaeQgz4-5eA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/sun4i: drc: Make sure we enforce the clock rate
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 19, 2019 at 5:20 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The DRC needs to run at 300MHz to be functional. This was done so far
> using assigned-clocks in the device tree, but that is easy to forget, and
> dosen't provide any other guarantee than the rate is going to be roughly
> the one requested at probe time.
>
> Therefore it's pretty fragile, so let's just use the exclusive clock API to
> enforce it.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
