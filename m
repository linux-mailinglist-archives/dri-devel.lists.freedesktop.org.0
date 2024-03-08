Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538E587674D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 16:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB0E112C6A;
	Fri,  8 Mar 2024 15:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="i8x1dB9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851E31138FC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 15:25:48 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-42f024b809cso294021cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Mar 2024 07:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709911547; x=1710516347;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TFLZXdU3ies1N74nkimz1dUi49Sig9GXkWQrBIaS9r0=;
 b=i8x1dB9sQJtwoNgjpRUgwJm/2c9ezs9xeZV99XWk6Hnshgs1XTnLmjWuEDgtquB5ER
 VFqq3NLyXNKZCdZRfdXFEAGq42pww0Ayui4vMNZ6lul0maRwG8iWvrRIo3Kc+ePV3MIA
 OwoUfYom6GNCK08c3OCFo/RGmOdgQEQIFDfJsCsDm6M4ggRJsyXVJ2Em8Qq4HK2Dgb8x
 JNi4SQVPNKdfC4sJHfZ/2/V/jH6Ey/XQhlYtwamNe1SWQ7MMq2JDDdVVZriYt5bUbDWg
 t1hr5Spy32zbiaCYDTiBDuRNNP8Zeoasd0eY3LucRWP9nB33zeu116Xm1HL57JkKOqaC
 uu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709911547; x=1710516347;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TFLZXdU3ies1N74nkimz1dUi49Sig9GXkWQrBIaS9r0=;
 b=ioik75oGmQeUS6lOeGkVEHtw5R7GIRDB+g44CD/SH1NWAA9Rc5GAffUJhA8t0Mpw3f
 lAhZB81HwRhRDh58zElaW9NQUI4Ah4FLEuSHpE67kgMlnHHhJzEpt47UYnPVbqsoBCI4
 uvxQELGJnXOsCx6MZ98ewQ9lMEY9snYI63vL8aaFNq1DjzO+CTbjGD9hgA+wXEHbM5W3
 XZia0/Vadq59Z0ct2s9UbVbxbw7I/Fb9vMTJS4ZHC9D+JChd5pq5mMbp/K2RNpEeSEeC
 cNy7mTRSxeCxzyU9hov+dKP4mzDyTr91xka7pQ9IAV0cJ4MgCX8ohh2c7spW1UuryK9i
 sHxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx/PcixBsXjrpb/TrxT7TMjpOQc9adJg0xkieVBwtCu93WjN+LNKCvYcZE6bf4dx1ves3F5O47OQGevu9chXYfZrRCxErFVxLnUknQc1rf
X-Gm-Message-State: AOJu0Yzo5uRJhlS5mfDAnLYABJV/UfUiOeyB76RCRBYM4EOt91W/TtAm
 HiZksR1dZyUibd/PPsiH9SjBbLfw+E6bY9tZv6zGBNAdAwKN6EaOlQBxiZQfjHP4/RYyyBemcqL
 pljAmtIrM2iJUJV3nlcflcWO8Fpgrhyh/iquD
X-Google-Smtp-Source: AGHT+IGwvRqhH5/5u0dRebXEE93CUmjojhrEOWLQxodoD5XGA8x68lzCwMdItYYAqK5wHkhfsJazt1RD0edt8txgF60=
X-Received: by 2002:a05:622a:295:b0:42e:b2a8:e239 with SMTP id
 z21-20020a05622a029500b0042eb2a8e239mr627320qtw.21.1709911546958; Fri, 08 Mar
 2024 07:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20240308004757.1048284-1-xuxinxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240308004757.1048284-1-xuxinxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 8 Mar 2024 07:25:31 -0800
Message-ID: <CAD=FV=V7t8vYZLunDLBh7xDPLoennBP+7Gi6b1Y_GKnYOW1cMw@mail.gmail.com>
Subject: Re: [V2] drm/panel-edp: Add BOE NT116WHM-N44 and CMN N116BCA-EA1
To: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hi,

On Thu, Mar 7, 2024 at 4:48=E2=80=AFPM Xuxin Xiong
<xuxinxiong@huaqin.corp-partner.google.com> wrote:
>
> Add support for the following 2 panels:
> 1. BOE NT116WHM-N44
> 2. CMN N116BCA-EA1
>
> Signed-off-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

It's fine this time, but please be careful in the future. I never
actually gave you my "Reviewed-by" tag for v1, I just said "The patch
looks OK" [1]. You should only add/carry someone's "Reviewed-by" tag
if they explicitly give that tag.

I'll also note that the subject of your patch starts with "[V2]". I'd
normally expect it to start with "[PATCH v2]". Maybe something you can
fix about your process for next time?

In any case, I've applied to drm-misc-next.

dcb6c8ee6acc drm/panel-edp: Add BOE NT116WHM-N44 and CMN N116BCA-EA1


[1] https://lore.kernel.org/r/CAD=3DFV=3DU8wdT_5k-yrLVpmh=3Dq4k18LntqujK7Mw=
88TdweBXCPgg@mail.gmail.com
