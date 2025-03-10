Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665F4A58E1C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 09:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BDB10E2E6;
	Mon, 10 Mar 2025 08:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="FKY9s/0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A145610E2E6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 08:26:05 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6dd1962a75bso25072526d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 01:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1741595165; x=1742199965;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t5e4kBY1ikFpBdgk4CnQxT+0uhR76oE9dg26e5s+zOg=;
 b=FKY9s/0Pxs0jKVNLDlpYl0ea2+pIJLh857mBF4G8ZRGTXPqbUWEWDzDfjLK9TdHk81
 wtQ46JxGvRgjnNwK7S/5NZISbd+UfcU+l48uB7ixb+KcS1HSQXWr3raUFVkAyv6E/IWw
 SRdV8UFaaN8rXCSGVv66mVmPbkAN/Lyub0QqK3el63Jo/NBGAeatsBr446RbeskZVyvE
 9bw7ExtFHcxtjcrZ8F2Y/Z8mThBtQd6c6XGknIbIXtehd/0eCQP1oeG4/+DbNGRrxdtP
 gK3wwalbC+DSVi0rXa9ZqS3EudP0hgEks/CD3VhElyrw+VXQaHTJcbWDGfDVcXLHCPlQ
 LScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741595165; x=1742199965;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t5e4kBY1ikFpBdgk4CnQxT+0uhR76oE9dg26e5s+zOg=;
 b=b8Z6iP8N/ETT749nzoaXjZcY2/z6znD33+agao8HQNVToPFMBsEeSLRcIaZt8/uGjh
 PMJcHRWMRSWG0xVUSOJRLqpsJc/FqjRPCkg6/9YwcBPF+8ySDNlHeSgHGU2ZUY/ePMLv
 zL8i30cGsX7+/Rs5ZMtxBJ7rol3T/hiWCYiBaupzfkCP0SbbMr8FaMjKs10/v1+9Gk39
 G6VQRVuRIVSkgPF4lMx8nk4bFOvxVjqFIJ2PAwRRNKhdAHHnAcU4Yd9GwfXCeSc0rjDy
 u7oaJGzE2ghIUT/rdWmESK+sslPKQxvfM0Cn2yAMANrb2op+tswbSzwIX3bGzs2EMzuh
 /9nQ==
X-Gm-Message-State: AOJu0YxFXz9AOjMyK6gARgOJzjmi9j5igEKDnxF2wGEXTeNsTfvCaOOm
 fBjF9X5qGKE+DBwgF4uRy0nXXbX4LLLHRHbTXIhEmCniJWDBaKOBG+UR36JJfwWZ2ueWkWQSaMw
 WL5bIPj03xEze2hzhkK6nblFElq+bIqifW0t8cg==
X-Gm-Gg: ASbGncuFe370J42trhoRISBP9GL8GfqJgpRGyG/1erR7gJvH1zG4L/aCEX3TOqx7jP1
 UiYxgZi5NerCzLyj+uaJHrNQ5OU+8xxxYkFjAVb07G474R7lPV9cggROXq6acpW3WZHmsHRTZU4
 NmgDQKKYCImmEDwmrVUAG+PDbjYSw=
X-Google-Smtp-Source: AGHT+IHwCbs1bBUI4qtOj3Idg/5ljrsF6Xs2ey8hGqNBmB9oD9+HRItkIzKnXGZD/eafOnoTRIZ/ohsJgV7HsJjpfmY=
X-Received: by 2002:a05:6214:2622:b0:6e6:6506:af59 with SMTP id
 6a1803df08f44-6e9005ea3cemr192846276d6.15.1741595164782; Mon, 10 Mar 2025
 01:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250228151217.563807-1-vignesh.raman@collabora.com>
In-Reply-To: <20250228151217.563807-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 10 Mar 2025 08:25:53 +0000
X-Gm-Features: AQ5f1JphmWdQucNXKj1iZZodcb3VwzpHOG7exv-uOZ7CsZrfAS5vAY-cxnWQ6j4
Message-ID: <CAPj87rOT36e3TwZwk8uGUNpSz0kGB_XUY2gbCvGYYy2Xguqv5A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/ci: use shallow clone to avoid timeouts
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
 valentine.burley@collabora.com, linux-kernel@vger.kernel.org
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

Hi Vignesh,

On Fri, 28 Feb 2025 at 15:12, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> The python-artifacts job has a timeout of 10 minutes, which causes
> build failures as it was unable to clone the repository within the
> specified limits. Set GIT_DEPTH to 50 to speed up cloning and avoid
> build failures due to timeouts when fetching the full repository.
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>
> v2:
>   - Set GIT_DEPTH to 50 to allow the check-patch job to pass

This sounds a bit fragile to me. Perhaps we need to make the
check-patch job instead specifically detect that it is missing history
and unshallow the history a bit more?

Cheers,
Daniel
