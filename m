Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3F4A9BB9D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 02:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8C710E055;
	Fri, 25 Apr 2025 00:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="RRazBpjg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCC210E055
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 00:14:01 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54b0d638e86so1891970e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 17:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745540040; x=1746144840;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=weepQ3o3E6eVKCjaxY3CTZ3gGB6j9iWw3wdfeMK8HxI=;
 b=RRazBpjgRjoJjnzrulTua5D1W5vyn06Z8PfICD2jzVB/K508IyUhLcE/5sa77cssmJ
 LZyuEagtYYdzf8cEyq7i/9gjrRRjmbriz3VdDYCJTkmOcscaV8I6flV3EHDqLI28Zg/H
 /IyM1mCoywKCCVuvhXQDVWwVZAdFXrPbX+2tM4hjaq5eHzuTPHde0z1g38q5gO4Dnz5N
 Up9oYN8ev0B2vPghXl2z72OK7oaqPKHtoKgiBEB92Cw34Q2aIrfdMd5+xTHQElnPCJ4b
 33JgNmOKIHKrYeiFurdm0LKsOCRGXg+XThtpXl+Q69rauKxwrvwPsk5rQq95PY+6d/Hn
 MrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745540040; x=1746144840;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=weepQ3o3E6eVKCjaxY3CTZ3gGB6j9iWw3wdfeMK8HxI=;
 b=f5wim6A2UX8maFAh3gKnXYcWaEJqiwhrbE6g7heEUDgYlOwGTlIfM25EYZXdLC9aUk
 lFOsYpWL/o3BFSI+0mpatMAC+NBvt9Ae4dpXs8IIPsZYfPSjrDcqwimhlWGY5BcI6Upj
 ki+y0S5zSnmU39Hr0TTvaN3zY8K47gNM4TNTaEzqYMcHAAZvbpLHmCsQtOAtks5bbwGp
 vAptUCpaMWQVMo5fNXfjXJJ8eC8Rv6WbaA8tN/MfKabwolRsyIRIYLoJ/4It6sxN88xS
 gl5EOmsRjhWxDKi5/+rzqI/hk6agpq4DcMYnTru8WCldH7gCp+L9mW/ZuCh6lxY3Vx44
 5RzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYk+YFYv/atS5q+PdOQsNbVuQO+4oZSddJow8W8W5gmX0ceaQSOwPClac4JRNpuHcRodop7Y6LMTQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxre06D420KKxFjKlovbnZlyDOYstPEaK9RJ+yvJQJLMA3u15bW
 dmFDcdBeKWTes0I9qytUCMGKlB4mqQm1MxQwnj7kNnHfEBStYKSWqY5Ph3I1yXvGN/A+c00Pk8p
 BWSqNtPdiLowm1MQUseHfVdzHqFxtcYJkYJs=
X-Gm-Gg: ASbGnctyRPhnocF/mIxcUnOM8PoAVu6TrDsJ9Zl3SuCO/OP0CwVLaQYGggRIrnixya/
 H5OSKiilrCTSJCZc3ihsKkU2J5f7oYsnVtt/TylJVxcSgj6OxoiXHYLw5iDVBLC2LX+zV8LjhmQ
 hFX/2rIS6EBoctBlH78Z+mT8O4DD9nIX4vIn4a5GfYFpMmCR1GEO0kkpL2tfMFSM4=
X-Google-Smtp-Source: AGHT+IFupDhtk787UYFC+m51vWARrrW+g3qeY1nzKmRJUOvJStBMU1HIyqroJk5ca7MURfz+ouovj/qgbuHigNDZtwA=
X-Received: by 2002:a05:6512:ac5:b0:545:2871:7cd5 with SMTP id
 2adb3069b0e04-54e8cbce2bamr107809e87.15.1745540039297; Thu, 24 Apr 2025
 17:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250422191939.555963-1-jkangas@redhat.com>
 <20250422191939.555963-3-jkangas@redhat.com>
 <20250424-sassy-cunning-pillbug-ffde51@houat>
In-Reply-To: <20250424-sassy-cunning-pillbug-ffde51@houat>
From: John Stultz <jstultz@google.com>
Date: Thu, 24 Apr 2025 17:13:47 -0700
X-Gm-Features: ATxdqUEd-WZkBCWlXClEEov2Vu7arSm9wmBJpDM85wdm6VobmqGM8s292rnkW9E
Message-ID: <CANDhNCqfsUbN3aavAH5hi4wdcKuUkjLX4jqhKzy-q+jCEqpoow@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
To: Maxime Ripard <mripard@kernel.org>
Cc: Jared Kangas <jkangas@redhat.com>, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
 christian.koenig@amd.com, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Apr 24, 2025 at 1:34=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Tue, Apr 22, 2025 at 12:19:39PM -0700, Jared Kangas wrote:
> > @@ -22,6 +22,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/vmalloc.h>
> >
> > +#define DEFAULT_CMA_NAME "default_cma"
>
> I appreciate this is kind of bikeshed-color territory, but I think "cma"
> would be a better option here. There's nothing "default" about it.

I disagree.  It very much is "default" as it's returning the
dma_contiguous_default_area.

There can be multiple CMA areas, and out of tree, vendors do reserve
separate areas for specific purposes, exposing multiple CMA dmabuf
heaps.
There have been patches to expose multiple CMA heaps, but with no
upstream drivers using those purpose specific regions, we haven't
taken them yet.
I do hope as the drivers that utilize these purpose focused heaps go
upstream, we can add that logic, so I think being specific that this
is default CMA is a good idea.

thanks
-john
