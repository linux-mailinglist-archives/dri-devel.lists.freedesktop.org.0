Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDCFA19BC1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 01:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9750810E0BD;
	Thu, 23 Jan 2025 00:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ud8OSaDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2088810E0BD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 00:25:14 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso417297e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 16:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737591907; x=1738196707;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dpixZz/z2G0JYG3X6KrDyt/ZUZbnxL1xxbr8djdHVwY=;
 b=Ud8OSaDVEcrFP92NMKiZMvUWRly6GQ1oRDyhFcPh7uldCWr3NsrzUfQ8bThziJRtps
 NqKsaDW4sO2O5p976wEuBIoB3ZoWSmp8AwnEYaCY4ku0dfIUx7oqyDTRkeIlBAiqDBLw
 0Xi5fWpeMYq8MEhF1HRu2BlQQo0aAbPZsXL8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737591907; x=1738196707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dpixZz/z2G0JYG3X6KrDyt/ZUZbnxL1xxbr8djdHVwY=;
 b=tKnosW+hMc3+eHaGl37Uvm74Y7K4W1N7TpMdosVsXgb85JzWzj9I9r3WveRwICjmCm
 z45Jg8xxS633OhPnk2Zwnai+XvJ9ezk2g+jw9kZC0bhItoevPSimTodw3IVAmyBCg5aK
 okSlkktfXWWzCw0CwwtGFENnA2VsyNdbhKr0QQhhq4I1qlt4seWdBBH0xrOTuKhMlti5
 R1ctUHenLsDpwUP7YS3XLttCPbOhuMUhYngiKKJ6RTtE9idd4OhtLkGVa0PcCqyGS3Lw
 mEDOjRef+gGfKyYi9ZEHKUguFIX5nFtvQAIC8Y7CZjuGGsz9krDyWrk5ESxI/p6EdYR3
 hi6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv7SKvqxZ6/GAISu5H143hen/JU2Vn1lJ5oBkh13Si10BLisb989nKOLQJEIjAYyy9eJfIPxQVWo0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKtVPDOo/Gfkg0UZrjPhgzfxuKC7QFyHGw8/MIr1Z+YE9a5EIt
 WfHlSIFvzdTq0Doc0bfccze0jn6AC2xK/6bJ1e4TgxCPXKwzyYzrRFIKJlkUhMa6ybEFVdIZPC8
 5VQ==
X-Gm-Gg: ASbGnct3OCPorbybbkOL55rInpyclqLngjq2wlEJz5JIWY7YnaSE38b7pkMcWW32reT
 v4tr28z6UAHpoFzBJ/Ohnk9QqjXj3JwSfGGoqlZkHx2N+AfU4ffIkj0vll06XX9QLVsyOCsZ3+7
 6yDwLJNZa8MuXVXf3biqlRXMJNVSbK5KRJoXJ/oIWAPoe/gpBtmNYog2PD+p8rlyXHCnZUG8IfQ
 ZXdJaNNvuEB4WT5vfSARVq2MnGTlucGAxZb9zFjTBR70UezoHtyoztBRqIbvp03TKR+HNqCYmjq
 U8XIJa/BCN1E+2hoET0FXFXqQL4q/TusYQ==
X-Google-Smtp-Source: AGHT+IGs70mecelWjYKkJHQzNMR/M/C3gbiQOqEQ/H/29Qwi365TeZyfCr8mR1TCb3NpxhAlftlY3Q==
X-Received: by 2002:a05:6512:128f:b0:540:3566:5b6a with SMTP id
 2adb3069b0e04-543c222ec2dmr351629e87.12.1737591907293; 
 Wed, 22 Jan 2025 16:25:07 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af7361asm2380365e87.202.2025.01.22.16.25.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 16:25:06 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so1771903e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 16:25:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWpOcQWgZJqo8zPB+wVDAHacrn0gZjC8tEK3NjmmLarhGLNge2sOh3OOGNXvJepeEnWeFSR9E7Jhno=@lists.freedesktop.org
X-Received: by 2002:a05:6512:159d:b0:542:23b2:8010 with SMTP id
 2adb3069b0e04-543c22820e7mr282716e87.23.1737591904301; Wed, 22 Jan 2025
 16:25:04 -0800 (PST)
MIME-Version: 1.0
References: <20250117091438.1486732-1-yelangyan@huaqin.corp-partner.google.com>
 <CA++9cvo18fMuaf+iPeXgMA2_+QMJ3YCAY1=odG31NKO3s5Vt4Q@mail.gmail.com>
In-Reply-To: <CA++9cvo18fMuaf+iPeXgMA2_+QMJ3YCAY1=odG31NKO3s5Vt4Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 Jan 2025 16:24:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xh5b+Jp99ODgo9U9bNLFcQgWQpHfjMa7odpCC9kkPyZw@mail.gmail.com>
X-Gm-Features: AbW1kvar_y-MjkcKaCAIlsgDN5HUYN3Y6Yvca_ie2q-8gRXANd0RQrIq3Hi3vLI
Message-ID: <CAD=FV=Xh5b+Jp99ODgo9U9bNLFcQgWQpHfjMa7odpCC9kkPyZw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Resend and include all necessary To entries
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 thierry.reding@gmail.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xinxiong Xu <xuxinxiong@huaqin.corp-partner.google.com>
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

On Wed, Jan 22, 2025 at 1:30=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Hi Doug,
> Can you spare some time to help review it? Thanks a lot.

Sure. Let me see if I can figure out what's here:

v1:
- both panel patches got reviewed-by from Neil (nice!)
- wasn't well threaded
- After v4 was already out there, Dmitry replied to the cover letter
asking for bindings. You pointed him at v4, which doesn't seem to
exist?

v2:
- Krzysztof pointed out the lack of CCs
- Krzysztof pointed out broken threading.
- Krzysztof asked you to sort the bindings alphabetically ("k" for
"kingdisplay" doesn't come after "s" for "starry").
- Krzysztof suggested you make the bindings patch into one patch for
both panels.
- Krzysztof asked you to reword the bindings patch description to just
be one sentence: "Add a new compatible for foo bar panel ...".

v3:
- Seems to have proper threading.
- Seems to have better CCs.
- Krzysztof's other 3 requests were ignored. Krzysztof asked you to
make sure you follow all suggestions or say why you didn't.
- One of Krzysztof's replies to v3 seems to imply that you were still
missing some CCs, but I think he was mistaken here. The CCs look fine.


So summary is that you've already got a Reviewed-by for the two panel
patches but you need the bindings ones. It sounds like if you just
take Krzysztof's feedback and send a V4 that he'll likely give you a
Reviewed-by tag.


A few further notes:
- Usually you should make sure you don't send more than one version of
a patch series per day. It looks like you sent several previous
versions of your series in one day and that can overwhelm people.

- When you replied to your cover letter adding me, you didn't reply in
"Plain-Text" mode. That means anyone on the mailing lists (including
the archives) won't see it. Please use Plain-Text email when working
with the upstream mailing lists.

- The cover letter currently has the subject "Resend and include all
necessary To entries". The cover letter SUBJECT shouldn't be a version
history. The version history is contained in the cover letter body,
not the subject. The cover letter for all 3 versions should have had a
subject like "drm/panel: support kingdisplay-kd110n11-51ie and
starry-2082109qfh040022-50e MIPI-DSI panels"


-Doug
