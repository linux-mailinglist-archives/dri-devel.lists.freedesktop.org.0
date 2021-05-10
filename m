Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0136379348
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321836E84F;
	Mon, 10 May 2021 16:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62336E170;
 Mon, 10 May 2021 14:33:50 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m9so16893776wrx.3;
 Mon, 10 May 2021 07:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iXsxoOt9fS3DXvxCyyFOaJfbPkU6WlTqA1MG4BgEpJA=;
 b=jIc4OS4UG1e9Htue39hs2SdJXCmPLn+MTostxG/pw06sXYt4cF0beJY8cOPd4XkNvN
 wMkWqq4rS4nqVWqmlHYwknDCThc4F5oj3a10x6AGXMwZ0Kkxjgx6mU53ky5S6gct5IOF
 gb8YE/CdqFeQhJSfkuXg75IoXDsEW/QKbfnCDm8DSyF/6zHxA2in236S9Jv233h02Cag
 nY/zUkluYzDhxrfM75C6Qnf/beBRBG9DBN2uslTW/jB8AmOrnU4strwuRTlIYCmTiED9
 Adakd2gy/AYmhY6PfiGery2Nb+BVYLJb2xN6RqR96XQSpLkoAkrrTIc1zJH3tzspThUx
 eDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iXsxoOt9fS3DXvxCyyFOaJfbPkU6WlTqA1MG4BgEpJA=;
 b=XtM2UORAwkRxZTuOFrtbMhcsYCVOl6DUl9j1/CkGWcFsS8NPe379sXOwylqsWN+4QD
 bZdNykSYa0Zz1zATeheIE8L+INPP5kX+ZMQnazetixD6z5EY2dB5yHeDfjJCxVrMzUuS
 Wo1DJPPzRtYGp58D9jWhEdIM/tyyi6rXKz6ysibXYAhYQAOUAhPI6SU7ZY0D71XPd7Ly
 kfQP0nPl7VyTJMuIxMnagm+xG8sM75nEEKEaakKjL3rClF8f41+PGzW+A9jkmglFrWeW
 eXUowyhD3PqWDlCIY8eL7C3AguS5fQX5dVX3ecPiiEvcgDqeUiag8R2tmNFfc/OBUxYn
 UV/g==
X-Gm-Message-State: AOAM5319qBfZzZSI13QHngM8sG15Si2AJW1eErtbL5plKqGRRfBtX+LI
 /P4LVLyjeBWHJsWmxszWsnsMx+uUZs/fjQ==
X-Google-Smtp-Source: ABdhPJze1q8t3iuv5DjzOv0RveTjqSpEwnprh+IG3St78u9eWCZrU93KSEZYLbobgkyZLBZ/m0bYBQ==
X-Received: by 2002:adf:e98c:: with SMTP id h12mr30469476wrm.314.1620657229579; 
 Mon, 10 May 2021 07:33:49 -0700 (PDT)
Received: from [192.168.1.122]
 (cpc159425-cmbg20-2-0-cust403.5-4.cable.virginm.net. [86.7.189.148])
 by smtp.gmail.com with ESMTPSA id h9sm20117820wmb.35.2021.05.10.07.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 07:33:48 -0700 (PDT)
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
To: Matthew Wilcox <willy@infradead.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
 <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
 <YJk8LMFViV7Z3Uu7@casper.infradead.org>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <ed65025c-1087-9672-7451-6d28e7ab8f92@gmail.com>
Date: Mon, 10 May 2021 15:33:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YJk8LMFViV7Z3Uu7@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 10 May 2021 16:00:22 +0000
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 linux-acpi@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-input@vger.kernel.org, linux-ext4@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-sgx@vger.kernel.org,
 coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-rdma@vger.kernel.org, linux-integrity@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/05/2021 14:59, Matthew Wilcox wrote:
> Most of these
> UTF-8 characters come from latex conversions and really aren't
> necessary (and are being used incorrectly).
I fully agree with fixing those.
The cover-letter, however, gave the impression that that was not the
 main purpose of this series; just, perhaps, a happy side-effect.

> You seem quite knowedgeable about the various differences.  Perhaps
> you'd be willing to write a document for Documentation/doc-guide/
> that provides guidance for when to use which kinds of horizontal
> line?I have Opinions about the proper usage of punctuation, but I also know
 that other people have differing opinions.  For instance, I place
 spaces around an em dash, which is nonstandard according to most
 style guides.  Really this is an individual enough thing that I'm not
 sure we could have a "kernel style guide" that would be more useful
 than general-purpose guidance like the page you linked.
Moreover, such a guide could make non-native speakers needlessly self-
 conscious about their writing and discourage them from contributing
 documentation at all.  I'm not advocating here for trying to push
 kernel developers towards an eats-shoots-and-leaves level of
 linguistic pedantry; rather, I merely think that existing correct
 usages should be left intact (and therefore, excising incorrect usage
 should only be attempted by someone with both the expertise and time
 to check each case).

But if you really want such a doc I wouldn't mind contributing to it.

-ed
