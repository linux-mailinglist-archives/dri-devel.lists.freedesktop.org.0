Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AC225F3D9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 09:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D2E6E137;
	Mon,  7 Sep 2020 07:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E730A6E0DC
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 06:35:41 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id q3so2163509plr.13
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Sep 2020 23:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=Lght7Ifr1LpMt8ODv/ddonkYDgzWp8nZkg1/c/SjWJ8F+ZngJs82vf/xcGWrzRvqY7
 ou1W681VqX+F9lu2Xqc0ZpV4i6UUyob9coYjA5tVJMOg07ZWGsDugXBqZBJWuaGCP+BS
 IfGVH9pKNnx82dDz/31NRPQDtBYa2qeQEUGBeXAiBUqJB+6B7fsASnM0vRbJTHMC9Qmj
 Wp5QykCr96OApc0FAUkWbPieinRUqhfSyP017+3ldlThqh0gNqvvYGQzol0Fi6Cm/Sp8
 pdT+pA8htrY9tVfsBb6O2UMBh8LZF5FBkt/j1e/oP9MkvS737M2GOLwfKA0H7Cyfa2f5
 lKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=k1zz1LJx23/VcfI8qBxAZ3yDNmDmJLJz7FMjHYeOMCNhLXxt8BJaP7FKR7wD69zMId
 Dn6zE/pW/TQ0xTZ8B3t41QUR4GLlAZTwOc37w9igqDP0uAShQPZHCgn3ImYcUbLvnS9Y
 NrSzaQTxOkWROwINSjVZKeMbGWqf4kJnVKeBrlFMVU82JRQs3+gZH0L2auWRCMBjt77p
 ZbLCryow0MQJrAiEF7XXbIjBKGU4tmAMRfPy1TKfrEtibk1JeYQ/voIv2MPzpSN+at2q
 GzANFB+SX9bMJoiowWG/VQzzCqVRJRFDFQiYcMqucTgjuYyvAAUDq/T/d2wl1yWR+qH1
 OD0A==
X-Gm-Message-State: AOAM531pZzrDW7Noyh0G3ZKU/7T+WyysbI6Xgm8k/xQkAzgtZ2KZrqCX
 wDnkA76kC8hCo61dvHL5tvA=
X-Google-Smtp-Source: ABdhPJwOD5kJx+DFcApvOWX+p/5e9qXZZ2sVaWifSzXJ6UpEB+RbV7/BqVTOwMBbgqsIz5Cei42hAg==
X-Received: by 2002:a17:902:8c94:: with SMTP id
 t20mr17926553plo.76.1599460541415; 
 Sun, 06 Sep 2020 23:35:41 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id y3sm11660330pjg.8.2020.09.06.23.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 23:35:41 -0700 (PDT)
Date: Mon, 7 Sep 2020 12:03:47 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v1 1/2] video: fbdev: aty: radeon_pm: remove redundant
 CONFIG_PM container
Message-ID: <20200907063347.GB29062@gmail.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-2-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806072658.592444-2-vaibhavgupta40@gmail.com>
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
