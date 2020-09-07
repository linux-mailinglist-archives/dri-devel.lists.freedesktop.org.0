Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D6225F3DF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 09:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8E86E22D;
	Mon,  7 Sep 2020 07:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39A989E35
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 06:36:13 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id k13so2071857plk.3
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Sep 2020 23:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=fbHCaOCT73QEitsORT8A7jULECshSkNFsfN0lqxLnv9NqtLuZTNiX299eqFsSn/i0H
 XMaY+57ZpeMCy9gD/sNhsDPGufEugVn3KjnZ+OJuMYTDHy967E6y5zQ+tY8J0ehM58Q9
 okbx0KCZthd774jTBDaqQ82+5V5gM1Qw9yhGYtouHWThA3P7v1+gpX4t/J88Jj7BGNE7
 CbiK2/6h2plBhRy9hZdcNAioNjc4IXErPDRGh/NcyVYimkrJ9ffD/2cJFyHnQ6isZM+T
 OwSW01Va2UNJWrGX5dr3UwV15jtf/OqmS4qGkgKEEVfJaE0e+R2/litSe+ceLyzu9iSY
 zJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=a6MFjk5egYyinHXgebiZitKXQvOdgWAp2236YBnWbQBTwGkyQKTek/MxuTb+xGDu55
 2MLwA6dIb8m3dQoOvxEGeUxrHS/L5rYcsJTRtgo1PzrZGojIYrvLLaIIPHwlNZ8c/iSF
 2Zscs/VziyVHvxURBEs1Hm7PjAeBIc4iLag9V31sp7PORcbEmqUxm98ZQSMdUZvzYAG7
 LjdTrSOlNhfO0cj2rGd/ZFlBlGfYOQ5orYkqbhYonkU5QZIeKLNFfBWvKVKDNbk4v2nw
 cmSiUof3dE8Qqk/14N8I66AsBcZC8bY+yDYQ3IMpZEb2SVwWs69pEPHKT9cTC7l+Tdk4
 kYQA==
X-Gm-Message-State: AOAM533eyOp7YL10OQwescHeKrvlAoNzJik3ljKU/Ot879fQHxAo6XLL
 XfCXo9fxQW5OLappNZR/+cs=
X-Google-Smtp-Source: ABdhPJwgx99BRCDhQRZTixm/9uPVMLMpWFBKTUcxE26SgTtzeQ5XhqrvRSSOK6jPTDclOjwHDi/NDw==
X-Received: by 2002:a17:902:a50b:: with SMTP id
 s11mr11590419plq.136.1599460573455; 
 Sun, 06 Sep 2020 23:36:13 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id md10sm11631756pjb.45.2020.09.06.23.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 23:36:13 -0700 (PDT)
Date: Mon, 7 Sep 2020 12:04:14 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v1 2/2] fbdev: radeonfb:use generic power management
Message-ID: <20200907063414.GC29062@gmail.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-3-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806072658.592444-3-vaibhavgupta40@gmail.com>
X-Mailman-Approved-At: Mon, 07 Sep 2020 07:22:17 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
