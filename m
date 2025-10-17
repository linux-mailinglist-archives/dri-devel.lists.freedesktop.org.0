Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EB4BE8D2D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24E410EBF2;
	Fri, 17 Oct 2025 13:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="wr+mn28/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D0A10EBF1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:24:42 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-b3c72638b5dso280011666b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760707480; x=1761312280;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kAPzxmZAKRETv1aAgqTv/3Qe7/Q8DRU161MvWKOur7I=;
 b=wr+mn28/lMxjqQ49IqFjJoggLozdKIbcNActkD+ZblidLaTgykhTiIGjMr0EnuiKph
 Rwgai5P1XTKNosUG5XMMNZYCU1i0w42lOtCVOtT2tKp0uIWz5Vz3OFNWfmgFvv4ZBB35
 S7HI0X7YjOBI8hfBw8sRXn3C086Ph5tWLR1pnS2DH2bKp+0BzlJjbP4p+1LgYy+RLe8e
 LK14LJXk5h3P0G7+sGnlUcAcFnJYnEKhUrcAgH5ovcW8hw4YRqraGSPQW3E9gllonR09
 X/cjurt9Xdt0oragh0gT4/Qg3SuQh0XETmAf2Emueuzq+XpEENtSvQqC9xZX7aC9CHmD
 4UuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760707480; x=1761312280;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kAPzxmZAKRETv1aAgqTv/3Qe7/Q8DRU161MvWKOur7I=;
 b=tC5wMXkb+yxkGARf026q6lGm+Kzid/4vQbCK/b6/Q7ATMgy3LJqRHzd2MaXTuVrLCK
 FGnh7ZOX340mJUqpRwQOfUyAWkImak0RDPHCvk/m/7un6RXUZinKHpLfHjVUTeD/k6qG
 BPMgsLsQ4iud0/mdhwrZ65oWrEG8O+ru7xDtK900vaO/zPrxBnURkq4009PMaMonqm7u
 cHUij0srUhOx97n1qdZ/gsy5eXY648xLgQUHZ+b+NMpz9uOP0Y9WH1omaUg6tzHKrbi2
 P3R9Qpp4Qx1F0bJfoF8fCB3XRkwVYo66Ym6ywV9kIArbbXiELd8pedwc6onQZOwR6VGE
 i+nA==
X-Gm-Message-State: AOJu0YwswtwirQwlUl4Fa2YPPXkr5ePJlZpEgH5AB+U4OjBys7CQ/yr1
 efy16S3aCv6edSZCwQ5LPOATcJegaR5i54iOzBeb3iIDfDQJgnXRdOFXCJvZ56jFAyFFLwQEv4W
 OdLG++0PfnZn75GGGZA==
X-Google-Smtp-Source: AGHT+IG+iL14vecShPyktC8BwMaW/uSlauMbjVXn7jXOXVhUbEdp41zM5x6FEcncWa9dDOidM50s71O00B81dbI=
X-Received: from ejap10.prod.google.com ([2002:a17:906:228a:b0:b47:8176:fd79])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e85:b0:b3a:7af8:c4a2 with SMTP id
 a640c23a62f3a-b6472b5f826mr440021066b.10.1760707476223; 
 Fri, 17 Oct 2025 06:24:36 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:24:35 +0000
In-Reply-To: <20251016210955.2813186-6-lyude@redhat.com>
Mime-Version: 1.0
References: <20251016210955.2813186-1-lyude@redhat.com>
 <20251016210955.2813186-6-lyude@redhat.com>
Message-ID: <aPJDk2mEAOWoyZC7@google.com>
Subject: Re: [PATCH v4 5/9] rust: gem: Introduce DriverObject::Args
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Asahi Lina <lina+kernel@asahilina.net>,
 Shankari Anand <shankari.ak0208@gmail.com>, 
 "open list:DRM DRIVER FOR NVIDIA GPUS [RUST]" <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
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

On Thu, Oct 16, 2025 at 05:08:18PM -0400, Lyude Paul wrote:
> This is an associated type that may be used in order to specify a data-type
> to pass to gem objects when construction them, allowing for drivers to more
> easily initialize their private-data for gem objects.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
