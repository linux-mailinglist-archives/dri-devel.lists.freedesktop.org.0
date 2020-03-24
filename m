Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA5B190E49
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 14:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34356E484;
	Tue, 24 Mar 2020 13:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E231F6E484
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:04:15 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h15so9110999wrx.9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 06:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1oa8yxV7xzZ+tD1LcZwM67jLdYW/JjWbnu15B5rKnAc=;
 b=pgrieuKBguK79BGSzhI7qQoDKjs7oVSsEZFIkfliQlS4z5oJJ8i92cBNzbOc6KuF1k
 eeh8US59wuikVQM5bbteGvBBxvsZWujEwU6Wt/GOypCDV7QldRZo2bm2Z3Z/oDT3qUxy
 IyyWUye5I8LOmsJlNfr1zBUhQVPRbiik4yERyYY8ajgeowR6YD9qVW9h8wHNhdTpBj34
 1nWgV2/0E+YFu3oaFa7h1tC6MO5jeXwowcGsQVjUfVFZi0+WKfIAiVpGy1hfpaOZeze7
 5SJ81Lzjc5G+49LBl1KyN8/cbBUg/ehWOfDEBzOwCJL3GV09zAwFEDDUuzXEF1FC2GTw
 Lxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1oa8yxV7xzZ+tD1LcZwM67jLdYW/JjWbnu15B5rKnAc=;
 b=Gojo1W9jOP057zqDvdER7jIVI7ouDDht1u/Sk1cFOcF3ys1DxGJTQ6kvZmgaCV2X46
 3RTsQ30lzRcYfZH6US4qg0BL5YZHJ48trN8cg0FFEP6dTec0x5a6xuhKWCuV/cQVKWB7
 Gnz/ihe0/c2wVQJq1ln2cPIAvoqmHB9GwpJQB0Ulmalik8GruTMBytabxfyAms8shb6c
 CqINYlS4P5xeRtP8qgbAl4JwMVpM77bi9Hcd5TmC6fHkW5iTWzGrexYGMojKdhZaGhhY
 ONPZE6BHVE+Pa30DkEKpohK0mnSYJx5bOTnts4LGx4P7BeBDu1uG1wLTAjYH8Svucl3o
 n74g==
X-Gm-Message-State: ANhLgQ05OU8bpZRWFBbgvajoxZqcun2n/kPmL5xSFF1u8UP9Y+MtvcE9
 k2PGukz/QiwvlWoMtKO/oJ4uwMtGqCx9ew==
X-Google-Smtp-Source: ADFU+vt/tZsuKl1gh3b+r/lHzGLKErJB8LKeO5CV2x9BnDtJ1QJrNAMaaIoqumVT6rOFGRemUbUOqQ==
X-Received: by 2002:adf:afdb:: with SMTP id y27mr37198227wrd.208.1585055052854; 
 Tue, 24 Mar 2020 06:04:12 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id v2sm30204625wrt.58.2020.03.24.06.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 06:04:12 -0700 (PDT)
Date: Tue, 24 Mar 2020 13:04:10 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v11 10/12] backlight: pwm_bl: Use 64-bit division function
Message-ID: <20200324130410.dwlg767ku6kwequv@holly.lan>
References: <cover.1584667964.git.gurus@codeaurora.org>
 <17fc1dcf8b9b392d1e37dc7e3e67409e3c502840.1584667964.git.gurus@codeaurora.org>
 <20200320133123.GD5477@dell> <20200324110710.GL5477@dell>
 <20200324125735.2mjuvbxt5bpon2ft@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324125735.2mjuvbxt5bpon2ft@pengutronix.de>
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
Cc: Guru Das Srinagesh <gurus@codeaurora.org>, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 01:57:35PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello Lee,
> =

> On Tue, Mar 24, 2020 at 11:07:10AM +0000, Lee Jones wrote:
> > On Fri, 20 Mar 2020, Lee Jones wrote:
> > =

> > > On Thu, 19 Mar 2020, Guru Das Srinagesh wrote:
> > > =

> > > > Since the PWM framework is switching struct pwm_state.period's data=
type
> > > > to u64, prepare for this transition by using div_u64 to handle a 64=
-bit
> > > > dividend instead of a straight division operation.
> > > > =

> > > > Cc: Lee Jones <lee.jones@linaro.org>
> > > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > > Cc: Jingoo Han <jingoohan1@gmail.com>
> > > > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > > > Cc: linux-pwm@vger.kernel.org
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: linux-fbdev@vger.kernel.org
> > > > =

> > > > Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> > > > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > > ---
> > > >  drivers/video/backlight/pwm_bl.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > =

> > > Can this patch be taken on its own?
> > =

> > Hellooooo ...
> =

> Conceptually it can. As the last patch depends on this one (and the
> others) some coordination might be beneficial. But that's up to Thierry
> to decide how (and if) he want this series to be applied.

... and on the backlight side we definitely need to know about the "if"
otherwise there's no point in taking it.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
