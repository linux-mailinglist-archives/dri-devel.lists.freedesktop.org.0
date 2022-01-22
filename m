Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A74496C9A
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 14:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806D410E2B9;
	Sat, 22 Jan 2022 13:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E7F10E2B9;
 Sat, 22 Jan 2022 13:34:12 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id jx6so7962370ejb.0;
 Sat, 22 Jan 2022 05:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e8hh0ttf5WPVcY+RjJGEBP+0C6QN/+UHlasoRckpvYA=;
 b=DAH1vUg+pWl4l4xR5PDM7YO/P7l6uHCABIctrRJ8cuwxYZzMhTIeavOJpv2vhPFkXR
 0kmkNOgFxXfopXIt0T4JSvOPYXf5QqXKEFxtwqncHEWVnaO9DDgpIghrKxhkGrC55fqS
 6lqCIJphynvCHXv3N3z0acq7iqbU37Wo3BMow4f4+W/n0iDFmLPPUdchX3HUBSGeGPYI
 DQk03O9FizCHE+dtCtWJKp/g9ALb3sUgP0qXztOR5iiWcmgnggCx6mpycVBF7Q/Jg7Q/
 886Rzie38TPE3rzT21/EMgQMBnHrMY4njYnJcmcVDr3NhtHK0bh2WbA5YHuwr8c2r0gc
 dz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e8hh0ttf5WPVcY+RjJGEBP+0C6QN/+UHlasoRckpvYA=;
 b=ZXXwgyIVK9IEB2JBHjG6JRUtD5eCDfaf0R71e8mE5Bij9Kg9nkwbgfYYBJWCA1yTY7
 TehfTTN8arV1joCjRPtObrjj/IqkQk1NA0bBrCX4ROQuemSLB1JvzUJr6TiLAJzeq1Xt
 g4oV3ZKm4ZDA8iZ1JLp77fLui/h/0VkYJAygjPpV/vaWr1AHGDL9P4pvUpSxnulBfnoY
 cTBBcH9WVfsSMdRPT5MhZS0AS5nso1yJPTXjlqPUlmGo3M1RgK0solr94/kiHDFnhpQE
 gW50n+RXo5eEMP+bHj2bGlE2QmVSXjZ+Ihfl3OsyTqwgzhDXhpxh3sPCOSgPI/TlrvuM
 5xCw==
X-Gm-Message-State: AOAM532HlT90FMkfIgKEzli1WhYwgGmqPBwFCzCz8My11gPyZcL7Q+fk
 bw124qZO8Ie5E+Ge3oN6PeEVaYzSdb17B9qKjIM=
X-Google-Smtp-Source: ABdhPJz15xCQwDBgEuc+XPcP4i6Bw/2wu1X1SCyF/jbi3hUsBR7++TQZJ4MsGPk9gQg9TgX0gILjLS53cSZnYuKJlCE=
X-Received: by 2002:a17:906:274f:: with SMTP id
 a15mr6678000ejd.492.1642858450621; 
 Sat, 22 Jan 2022 05:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20220121165436.30956-1-sampaio.ime@gmail.com>
 <20220121165436.30956-2-sampaio.ime@gmail.com>
In-Reply-To: <20220121165436.30956-2-sampaio.ime@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 22 Jan 2022 10:33:58 -0300
Message-ID: <CAOMZO5DX-zzQGi6hWj66yHDYAHXd7yzJ6CQqtHVQHt-U4LVq8g@mail.gmail.com>
Subject: Re: [PATCH 01/31] gpu: nouveau: nouveau_led: changing LED_FULL to
 actual value
To: Luiz Sampaio <sampaio.ime@gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Luiz,

On Sat, Jan 22, 2022 at 7:44 AM Luiz Sampaio <sampaio.ime@gmail.com> wrote:
>
> The enum led_brightness, which contains the declaration of LED_OFF,
> LED_ON, LED_HALF and LED_FULL is obsolete, as the led class now supports
> max_brightness.

Your Signed-off-by tag is missing.

Please run ./scripts/checkpatch.pl on your patch and it helps detect
this kind of issue.

Regards,

Fabio Estevam
