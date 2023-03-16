Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B5A6BD571
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC3510ED5F;
	Thu, 16 Mar 2023 16:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B348310ED22
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:22:31 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id 97so1572435qvb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1678983750;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9GBmyw0WJBg7ZCrOCyO2Mj9DN8D/RYHEWxuq24q58BM=;
 b=IBbPWCSwUaEft4y5eeSYVHPLcYKZe6q20jMe8CFCou9o8KL0uPCCP39bC6WjHexpL3
 h4ChTrGg9orCknI95a3z0l3Gw3j6Ry3Y/Io3bKEjrTWpiLrgc3A6GcUTlQQC1nzfcHGj
 wjf0n7z2sSyDo7hSofVu9srGEi8xnZ0o26udc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983750;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9GBmyw0WJBg7ZCrOCyO2Mj9DN8D/RYHEWxuq24q58BM=;
 b=y5yBicuDRrOSl9xDh22qSf5IlUap1iphqgPeWtLF5vdSfHSueqKUVOHTEssa4I7ocn
 Spy3VvU5ic9ToJAEiAbKt/Fy1GCuzo1TGTnZILG/Pw9Q3ttsoac9/ZIW+F01+eMmEz6O
 dOPzjKE9Rx0tGLScn0zseRwe1+rkdQM3YgslCSa5MfeGh6mkO5SHisQ++DNviDEH95WI
 9mkU5Jk4DL5wszSPpnJwCY6mD8xCeRP4lDAs8rCWCIdjhi3WXPEBPtfSC128S3Tgwjax
 RBiA2uDSYBPiPY68Ws5LmnYIaxbzraUUeF3ywEvnAd3OUtuSYmJw9h9O7MvoVhAdpS/v
 4VLA==
X-Gm-Message-State: AO0yUKU+TBAOJrgkDTPCszE1UPDK0C7zH1XUjtDMZ3/VGc2e7ejOtTH2
 DI+/Ov6fbf79oXYxdaH0xfCUrQ==
X-Google-Smtp-Source: AK7set8xEGt6h86HL22O97EmhJZzwZ6k+fOwDGCLLvjvxO6ADEVZBNhra0L2aLE9daBvgDOrEjePYQ==
X-Received: by 2002:a05:6214:19ea:b0:5ae:419a:8c22 with SMTP id
 q10-20020a05621419ea00b005ae419a8c22mr11533826qvc.5.1678983750655; 
 Thu, 16 Mar 2023 09:22:30 -0700 (PDT)
Received: from meerkat.local
 (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a374406000000b007423dad060bsm6139056qka.87.2023.03.16.09.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:22:29 -0700 (PDT)
Date: Thu, 16 Mar 2023 12:22:27 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH 0/2] docs & checkpatch: allow Closes tags with links
Message-ID: <20230316162227.727rhima2tejdl5j@meerkat.local>
References: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
 <c27709bd-90af-ec4f-de0b-3a4536bc17ca@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c27709bd-90af-ec4f-de0b-3a4536bc17ca@leemhuis.info>
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
Cc: Jonathan Corbet <corbet@lwn.net>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joe Perches <joe@perches.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>,
 Matthieu Baerts <matthieu.baerts@tessares.net>,
 Andrew Morton <akpm@linux-foundation.org>, mptcp@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 10:22:18AM +0100, Thorsten Leemhuis wrote:
> I liked Andrew's `have been using "Addresses:" on occasion. [...] more
> humble [...]` comment.  Sadly that tag is not supported by GitLab and
> GitHub. But well, "Resolves" is and also a bit more humble if you ask
> me. How about using that instead? Assuming that Konstantin can work with
> that tag, too, but I guess he can.

There's a subtle difference between "Closes" and "Resolves" that may be
important to consider ("closes" doesn't really imply the bug is "fixed").

The Bugbot should eventually support a number of "if this, then that"
conditions once it's done, so which tag we look for will be a matter of
configuration. It's not yet at that stage, though I should have some initial
trials in the near future.

-K
