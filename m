Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 573372EFF3F
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 12:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601036E944;
	Sat,  9 Jan 2021 11:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480326E85A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 22:24:12 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g24so12690027edw.9
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 14:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=65lMCw2uLUBcxYvJ/e5V4811Ykn625B5GYTiXJBwVCc=;
 b=fUnUfac1TebvsWYtVx6JiOuQQ2Q0vwir+MVCI775OppsK29eCxhqfK8nXL9hw+gBHi
 aoOGmHqRnAP7xWQ8aCb3yFRXyDtQiu7PYKqHYCXiDYifi0ARulI2D/QvDh5WtZ9BETCL
 Bd2jsca2cw9iwKhkqRXSpuiT+xTINkNa/Cd66Ic9U0kaQ2v6g3rCulNepnd6cllKoCpZ
 OuVG4JgKHtR7IoqnBQXy2LrCQGLs9pcbiiCai6IC1IdRIJEXijVgzraKe5r198R/oEdS
 fMYzsYfI4WJy0UcMx0N+W/IVhQCdtZchhwpNr54Ejo8lFiJ5jIS5fje8FOjf/K9GVGmB
 ZJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=65lMCw2uLUBcxYvJ/e5V4811Ykn625B5GYTiXJBwVCc=;
 b=j9qkMaGUzNnNbjYmSydfdugfIkFMjk2/CvQdEsQ+8eADvDD9gOo41iB7dGp2NwWeIK
 cpot48i1pHlqN+UjzK803ORyeFIUJ8nPQ17cyJdE9FcW5zEN6NT1seBZUucLXb64A54S
 WZhFMJE6G1KEERBQaabzMw/Y/ofCqMwhOnbcYZZDpBJSS3Xhyf5F3PdqPhu5H+UcH8OP
 dS1sx/0s1Ezu0G4yRk5oiZN1KFTF1VvA2klMIGec24Sdo6/C87GEpl2EG+mkfhfUPYf6
 UgttJA5XHZRgb0F/JNdzVDTh1FX1k2XDkOWFPQhhGMuPpxWo8+3OFClUdBhdBCUp2bih
 K+Yg==
X-Gm-Message-State: AOAM532VUg0PLXgGsre5rK6joEFsf/uwBkLCyMs546hKtHMO7dkd6evk
 AbwirUgt4Akm6sIZUTg1S7Y=
X-Google-Smtp-Source: ABdhPJzfi+ZwjvmV+AKMuKu0DVkAOqm+JXTdJeAkMOWoDE+DSlijmTqiLaOmjcMDfUDOvGGJCKwQQQ==
X-Received: by 2002:a05:6402:4c1:: with SMTP id
 n1mr6744966edw.66.1610144650846; 
 Fri, 08 Jan 2021 14:24:10 -0800 (PST)
Received: from localhost (ip1f10d3e8.dynamic.kabel-deutschland.de.
 [31.16.211.232])
 by smtp.gmail.com with ESMTPSA id h15sm4027718ejq.29.2021.01.08.14.24.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Jan 2021 14:24:10 -0800 (PST)
Date: Fri, 8 Jan 2021 22:43:13 +0100
From: Oliver Graute <oliver.graute@gmail.com>
To: thierry.reding@gmail.com
Subject: Re: [PATCH v1] drm/panel: simple: add SGD GKTW70SDAD1SD
Message-ID: <20210108214313.GA7979@ripley>
References: <1608381853-18582-1-git-send-email-oliver.graute@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608381853-18582-1-git-send-email-oliver.graute@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Sat, 09 Jan 2021 11:46:48 +0000
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
Cc: David Airlie <airlied@linux.ie>, sam@ravnborg.org, m.felsch@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/12/20, Oliver Graute wrote:
> Add support for the Solomon Goldentek Display Model: GKTW70SDAD1SD
> to panel-simple.
> 
> The panel spec from Variscite can be found at:
> https://www.variscite.com/wp-content/uploads/2017/12/VLCD-CAP-GLD-RGB.pdf

some clue what bus_format and bus_flags I have to use?

[   42.505156] panel-simple panel-lcd: Specify missing bus_flags
[   42.511090] panel-simple panel-lcd: Specify missing bus_format
[   42.615131] mxsfb 21c8000.lcdif: Cannot connect bridge: -517

Best Regards,

Oliver
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
