Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CF5132CFA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 18:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075756E830;
	Tue,  7 Jan 2020 17:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7C26E830
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 17:29:20 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id f8so283935edv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 09:29:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YM2FDBRbIHSxAEhG7R1sVXNWb1hl5iolj+NDBi0m8a4=;
 b=GqmtQF342XjIuS7rb3BtMlB6BXNodXHl15zygHSDxoIGpldY97/MjckuqBdNRdIdN6
 stLe2ZMB5iXewxUaQH7a3RAuYeBWHq1M9PmkboU4UrbvO79i2anGBxRH6sXMhDw5+EeW
 C+rDN+Vsy17rkoXFd80YRS926UXJOcZTrpUNyCpZbXjpn0nvJjB2AUfjnYhlVuGH+F10
 nVWiOz9gfOLFM8M/sGTZvTzUtAdOntE82g/Fb4ngkK9LKcnI80WsoAQmAN5S3UAacEnz
 aQEXKdTUqMf+FrEQC/4ynIe16UwkG3jUbIp9ordqHNvQNaFMb/tjdF6qvDaD18r80EzF
 mlXw==
X-Gm-Message-State: APjAAAVn0t1n04AdeUrTis/3t7BJPhCicvGYE7mnbpI8Zea92U/xe1pw
 nJy13tPI6ZOk9Cyvz7cCQlxlNkleOdo=
X-Google-Smtp-Source: APXvYqz05zjOSKmmt+E+x2e+EpVc7V7cpBEJhRByU8xCSkszG5YZBnT3r3nqk4bbP6pXergQKUqsPQ==
X-Received: by 2002:a17:907:20ef:: with SMTP id
 rh15mr478041ejb.325.1578418158289; 
 Tue, 07 Jan 2020 09:29:18 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47])
 by smtp.gmail.com with ESMTPSA id x2sm9977edi.95.2020.01.07.09.29.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 09:29:17 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id g17so351052wro.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 09:29:17 -0800 (PST)
X-Received: by 2002:a05:6000:11c6:: with SMTP id
 i6mr188156wrx.178.1578418157536; 
 Tue, 07 Jan 2020 09:29:17 -0800 (PST)
MIME-Version: 1.0
References: <20200107165957.672435-1-maxime@cerno.tech>
In-Reply-To: <20200107165957.672435-1-maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 8 Jan 2020 01:29:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v67MuA8T-v=dbirZA2E3sP_H2n2wxvOGgP-y=pJT8gZSSA@mail.gmail.com>
Message-ID: <CAGb2v67MuA8T-v=dbirZA2E3sP_H2n2wxvOGgP-y=pJT8gZSSA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/sun4i: backend: Make sure we enforce the clock
 rate
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
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 8, 2020 at 1:00 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The backend needs to run at 300MHz to be functional. This was done so far
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
