Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DAA8BD521
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 21:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B44310F7F5;
	Mon,  6 May 2024 19:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kB+Nyve8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF6110F27A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 19:04:49 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-61bee45d035so26448187b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 12:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715022289; x=1715627089;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tW6ZXbuxNCkRRdetUmGMqtCDIB19FjpOX7Yn0qAHvpM=;
 b=kB+Nyve8gB0V/WndKS53xzkl31wyJl3zWk72X3IwVgo1b83opdpLaC8jqWXhavgNeZ
 onNnMlNBar43YiDSluOjO+8ephnlLIwtE800OqwzSRBmouAex2uNWKnU1TERDuHkNWRQ
 TP++Jyg2p56VUOFA68l2Fjpl0kaLCb5ZHogKczXXJwBIAhxTqp1LrfgLcfW7FiPUqIEN
 gFqN7yBWFCgBrBBkpUy3zBnBzmhgyMRD4c3KFMJOcIcpoYPN/GhRMBvjzj+GTyZZPPa+
 9nU92zEevbDBTN/WRVALL/wf4BFlHOrl+x9QBFYXe4WaxFgKllLiiJAqyWL0k4wNY7da
 YqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715022289; x=1715627089;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tW6ZXbuxNCkRRdetUmGMqtCDIB19FjpOX7Yn0qAHvpM=;
 b=khFnD6uso3/A3xvlWrB4MjGGeJLK29wQ4LEq2AWj8vSIchpxLquHkYsSOqc8Trlr2P
 OVEo0RgxoeFqrIjElNYB7LJ9MNrywsXpqPf9zmb+lBQG/w+V9yGOjzwzI/v0wSj7wBvA
 dItCRbTB1pgC8QZUt/wKo5Obrv9Gdm/gROnmSHy1qJ3wDDadxUAuT94NSECajC0EuKm5
 nhj1cU62uegtfpd8zNQ+roha1HST1BRvN6Aa7k40RbzIiuzzQZHfXr8vXu6XbHhftuXu
 VtIylQ6Lgb+qTNRK0C4MzcVwaa4qsUp+/K6cCvleQcC6vLZJwXz9lTEMwbUCSvSPHQ9R
 r7UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/f0j9NI6YoXD6bgXnneG2b/EUPId1+wqkvoXvVPQzIU06q2VGhtuvEDU7RzLbb3qJ6OGo2Jt0D2C9vJSmff313xiNmigR62cW7n0aHiUs
X-Gm-Message-State: AOJu0YxsBTCFP6pSX0mHW52Iybg3Q9rGDPuS66u70JinWSg5I1j6jFeL
 iOMHmwaQz+DygQVourfaws5HUaK0UAyl2kVBLWk/+vpzEwJCWQcWjjyAAzLuyjY+UQD/dwgSdvn
 Xe9L3UAvF0YofaZL0NATU3fMD5oXBWvcfF822
X-Google-Smtp-Source: AGHT+IEHS4oNIdmD9nG484I0nYBm3aQGegCbP8GsgU98ex98+CK429DdDBUHk35GcJvZBDxds6QwOF+YUNMpYcLD1EA=
X-Received: by 2002:a5b:1c7:0:b0:dcb:f7a0:b031 with SMTP id
 f7-20020a5b01c7000000b00dcbf7a0b031mr9837906ybp.50.1715022288568; Mon, 06 May
 2024 12:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240327022903.776-1-justinjiang@vivo.com>
 <5cf29162-a29d-4af7-b68e-aac5c862d20e@amd.com>
 <cc7defae-60c1-4cc8-aee5-475d4460e574@vivo.com>
 <23375ba8-9558-4886-9c65-af9fe8e8e8b6@amd.com>
 <CABdmKX2Kf4ZmVzv3LGTz2GyP-9+rAtFY9hSAxdkrwK8mG0gDvQ@mail.gmail.com>
 <e55cad9b-a361-4d27-a351-f6a4f5b8b734@vivo.com>
 <40ac02bb-efe2-4f52-a4f2-7b56d9b93d2c@amd.com>
 <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
 <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com>
 <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com>
 <d4209754-5f26-422d-aca0-45cccbc44ad0@amd.com>
 <289b9ad6-58a3-aa39-48ae-a244fe108354@quicinc.com>
 <CABdmKX3Zu8LihAFjMuUHx4xzZoqgmY7OKdyVz-D26gM-LECn6A@mail.gmail.com>
 <8ca45837-cbed-28da-4a6f-0dcec8294f51@quicinc.com>
 <83605228-92ee-b666-d894-1c145af2e5ab@quicinc.com>
In-Reply-To: <83605228-92ee-b666-d894-1c145af2e5ab@quicinc.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 6 May 2024 12:04:36 -0700
Message-ID: <CABdmKX2MWU9-9YN46PXx-Jy-O9CHMv8hCkvArd7BbWUBs=GPnw@mail.gmail.com>
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: Charan Teja Kalla <quic_charante@quicinc.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 zhiguojiang <justinjiang@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 opensource.kernel@vivo.com
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

On Mon, May 6, 2024 at 2:30=E2=80=AFAM Charan Teja Kalla
<quic_charante@quicinc.com> wrote:
>
> Hi TJ,
>
> Seems I have got answers from [1], where it is agreed upon epoll() is
> the source of issue.
>
> Thanks a lot for the discussion.
>
> [1] https://lore.kernel.org/lkml/0000000000002d631f0615918f1e@google.com/
>
> Thanks
> Charan

Oh man, quite a set of threads on this over the weekend. Thanks for the lin=
k.
