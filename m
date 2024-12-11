Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5999ED3F7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 18:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B6110EBC6;
	Wed, 11 Dec 2024 17:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Iy71Fyib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F7110EBC6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 17:46:52 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e3a0d2d15adso4808872276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 09:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1733939211; x=1734544011;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XX4yF9JMGXX3II/VI0ICz4h+LN+8Yz44eu6TfJ04Ugk=;
 b=Iy71Fyib4luCZvwEqLaRsLNtjvzAMp+6klAYJWOlhTDx4QJZVbJ8xhCN87YvhUjUU/
 gsAdj2z83ez0BYRkclcRQsfQACgf+NnFKz2ke2kQUYydbLrAFBh07narAQpDKCtZC2IN
 tGIv+RQlqoD1FnzroFmn6rDG4ytusIL/FGWHhCqO5zBVAest26LwyEk70jZxrkSiUy6i
 PlGHgwj7TBpopWWb9BQeMnhcu01BwPa7O+AiqA0gL5yjf731Jhm67CBZbcLUbi/AhAIw
 eyvN9OdFW33zFK7oZMpqftWEQF35noDdAA4DvWJfHcTtNGwI9B7HyhrOKzw4RnexZT9q
 op9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733939211; x=1734544011;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XX4yF9JMGXX3II/VI0ICz4h+LN+8Yz44eu6TfJ04Ugk=;
 b=Mv2x7Vh9OlXsZE6gGwMTRY5AWbiKtsUkGD8apD1Fj1U6BbQkPYq5TCQ3YB6ae1tewM
 eauAN3YuSBxL65Ysvhx7z4FB/I7dADgj6JeAxUExnpAQ8NqLn0vDmo9nJyii08BHpC5/
 fleiSjCo4RZ8nWmhyvzP71LseT90BNuWay4xs55l2/lf4D4RgEzZw9rKhdkDuIXLnu4b
 DEhMvrTZeqBch398Tft60+21n66K+HPf5Cz0n5ufNcvIoZLIKVukumHoVHIQcg3e1B9S
 RAH9CrXZK1oN1Y5fARHxNiaGPZ1rKeHrVRSi6dmYKeQ7tE9WZpsLT8+rodZL1uxOafuj
 kXpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKTLT55bGOv/e+fnfcZcKIyux95Q4FzugrIgwjbUREusDwbX0ZhjKuWoWBbEbJc0XUagqqwrcWCqQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaC4ETrPbRHDL9+wkS4HuASk9H/bQcuc4NR0bh/ypaJBa0vz+D
 yVl37yrZ380HtWiGp9Tp3Ky47wob5BX5gsXDSA/yDpQLGU7YJxAQxFBX1tfYaO0ClnpoyokW9Dp
 ihyLd7r/CwQtIJsUjp06B0q9cZt8PLLVAi+FPsw==
X-Gm-Gg: ASbGncunFs6TqV/LB7EmPBHR8+Wlm9Ed06+N8NajjJ/cg5TNjDDOswJJBYthnGy045W
 oxT7WzAhLAYKBqTDvOhR1BcgMCRbbbvzR+PI=
X-Google-Smtp-Source: AGHT+IG3lDp6pcc8WpN9DOxtNpymp29steFnShZFR78LeXrDU2v7lqz7zSz8oGrhbnT8m3jrCYcj2LxsZTVFVNmSQds=
X-Received: by 2002:a05:6902:230d:b0:e39:8a36:5771 with SMTP id
 3f1490d57ef6-e3da3158089mr228005276.34.1733939211006; Wed, 11 Dec 2024
 09:46:51 -0800 (PST)
MIME-Version: 1.0
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
 <20241210-converge-secs-to-jiffies-v3-16-ddfefd7e9f2a@linux.microsoft.com>
In-Reply-To: <20241210-converge-secs-to-jiffies-v3-16-ddfefd7e9f2a@linux.microsoft.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 11 Dec 2024 17:46:32 +0000
Message-ID: <CAPY8ntDHcGpsaNytY2up_54e03twqZ2fj1=JTnb8x7LLo3uGDQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/19] staging: vc04_services: Convert timeouts to
 secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, 
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>, 
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Louis Peens <louis.peens@corigine.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 netfilter-devel@vger.kernel.org, 
 coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 cocci@inria.fr, linux-arm-kernel@lists.infradead.org, 
 linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-scsi@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-mm@kvack.org, linux-bluetooth@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 ceph-devel@vger.kernel.org, live-patching@vger.kernel.org, 
 linux-sound@vger.kernel.org, oss-drivers@corigine.com, 
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen <anna-maria@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 10 Dec 2024 at 22:02, Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
>
> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> secs_to_jiffies(). As the value here is a multiple of 1000, use
> secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.
>
> This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
> the following Coccinelle rules:
>
> @@ constant C; @@
>
> - msecs_to_jiffies(C * 1000)
> + secs_to_jiffies(C)
>
> @@ constant C; @@
>
> - msecs_to_jiffies(C * MSEC_PER_SEC)
> + secs_to_jiffies(C)
>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> index dc0d715ed97078ad0f0a41db78428db4f4135a76..0dbe76ee557032d7861acfc002cc203ff2e6971d 100644
> --- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> +++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> @@ -59,7 +59,7 @@ static int bcm2835_audio_send_msg_locked(struct bcm2835_audio_instance *instance
>
>         if (wait) {
>                 if (!wait_for_completion_timeout(&instance->msg_avail_comp,
> -                                                msecs_to_jiffies(10 * 1000))) {
> +                                                secs_to_jiffies(10))) {
>                         dev_err(instance->dev,
>                                 "vchi message timeout, msg=%d\n", m->type);
>                         return -ETIMEDOUT;
>
> --
> 2.43.0
>
