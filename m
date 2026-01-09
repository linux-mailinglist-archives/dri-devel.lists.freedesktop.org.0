Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F25D07DFF
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4B910E81B;
	Fri,  9 Jan 2026 08:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="TdnNyIq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3396610E81C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:40:28 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-59b67388c9cso4851014e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 00:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767948026; x=1768552826; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qgQguY/3yJH9vjqUKAYyFPM3gXFuXFaFqMIhKXi9SEE=;
 b=TdnNyIq5Y7N1gkVKB4vjolMlgMjXBz78jH+yXy8A7DK5KdjxdIdKhlRep7NFHvCPqy
 uRpAPKcQrZAay+2q3daZAvIBDqoZH4uLUoyGR+vgmay8kKklkVupF8Q4H4C4A6AMoEVY
 iKQ8XIWBK7p+uggYJS8Vng7jYkiJTe21rQusHcaM8jI9t7lip0gf7+76ET1/kyLwEVdL
 F+14Otp9F8XMXzWs82o22dEPKjNOgx3FZKpCzFOtXYAhP5MlX8r4wc0yLMfhfrE8QH/y
 AkMd0LjKI/TWbFXMUvnGlMpNrILaPHimKkqoqvF+q1tCWKrrRKngwmgeCKeB1tlThmzU
 56eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767948026; x=1768552826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qgQguY/3yJH9vjqUKAYyFPM3gXFuXFaFqMIhKXi9SEE=;
 b=VJhiOLD4m4HEyDqCfEqsKKig6JH+gKMD6SBkcxPEyISEVNmVeJ+cXL3LuDxNH4JCIn
 7bKc70EyV1yxt1CrGL1+QNR26x/gg6ZAa3fSdDWzdFWkZlArBtqxQNWejajhrTnuHhKo
 jW9XKGq0q51yQ5F8cDkcIvwRYgzNicDIz0OpK88j8p0T7Gxf7AHkyrLwc3INxtB62wVG
 Z83dAp4Et9xMrH+NXFpZlgDl5Nwcqlb+4uJK9qmH8p1J0qL6UZWowo7grksvdQok9qHR
 0uOGzMLofRfnt0wCObmACbyWQpUOaNvpozAu0RFhv5EbhX/Qm7ElKYYUHwkbLHUfXwdY
 p8/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkrhzT7Smg0TTx+fzx9IlpmyZRms0kb2I0OTras4lwH8Pph08HP34ryGnKdx+50kHPXD7Xu0EOeeQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIZILHRwSfhKpZysJl0IRjKJSTz+nChk+oC6wMODcRg1mfDoJj
 6jHeo3w6rlXo6MH4jGUYpVe58070mO60m52KNZDkEy9fVmZbKhzbdlTRdddd3J31Ldzhzj/btsZ
 4dLN/gr5YFw9v1FN7vh+jC6XeQJV3zVEJAly+XKXJog==
X-Gm-Gg: AY/fxX6B3nq7b0Q/h6nhNIvft7i9ZJ9DBaSRGpYo6NixY6sx11SL37M0fLCp9xtXw95
 Qx5EaQRo9OcmVBfzHAS1EHrT8eAlMaq1yozSCktfUoMmxZPcvRJTfZG8exA3sMwhy/jV08mnbh2
 KfYj+kyDkWb+htzYHniALJGkbeWvY8THSDFEXCJBBzlOImVbUuIGm8KYU7jgyjEWDA34kiMg//n
 r8HMXv4vISAnejsLsGscuszWA9Dv09PYXFWlwCqW6JgysB4Og7UXmoafT0hkDl4IlaxIYbOaeRf
 GCFb1sPbI/8yE7bLsWrn02dC0R3l
X-Google-Smtp-Source: AGHT+IFXtN+0YseD+T9APEL+SkiwbT/sxspD361H4WQpvC6fXEypZdSjIbUo+lRliv69WpOghJ3hZ0q6u2fo/hSlbqM=
X-Received: by 2002:a05:6512:b90:b0:594:768d:c3ef with SMTP id
 2adb3069b0e04-59b6f036b83mr3136147e87.30.1767948026027; Fri, 09 Jan 2026
 00:40:26 -0800 (PST)
MIME-Version: 1.0
References: <20260108180148.423062-1-marco.crivellari@suse.com>
 <aV/5KRqR6zma/ZnR@lstrano-desk.jf.intel.com>
In-Reply-To: <aV/5KRqR6zma/ZnR@lstrano-desk.jf.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 9 Jan 2026 09:40:15 +0100
X-Gm-Features: AQt7F2q0EjRPIBo-O6epKd7ztDdCOc6wx1_RFqjOb_frYVIgnRnJP8VDXYpdajg
Message-ID: <CAAofZF4F9ZvLMj-=ge2esbvpgoFyyzCdBc2E82inbXry8kKLrA@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: fix WQ_MEM_RECLAIM passed as max_active to
 alloc_workqueue()
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 stable@vger.kernel.org
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

On Thu, Jan 8, 2026 at 7:36=E2=80=AFPM Matthew Brost <matthew.brost@intel.c=
om> wrote:
> [...]
> Yikes - thanks for the fix. Will apply our tree shortly.
>
> With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks Matthew! :-)

--=20

Marco Crivellari

L3 Support Engineer
