Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1679DA124
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 04:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145C910E0F6;
	Wed, 27 Nov 2024 03:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gohCSeHn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C84310E0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 03:32:15 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6eeb66727e7so62233347b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 19:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732678334; x=1733283134; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=whLrwTDQh9Q1vAtIf5Ue5wkiYoi+msqtQm0tKNkrgkc=;
 b=gohCSeHnImFC7HzYO+5kuQL5CwGzwMNAC2mYnSmjMSDVaRMZdRJoFqApbua0EJ/0YA
 XqpXRxR8U2VxF2fXQnxG2qviCA3CqFQMYwSOIPP2ONlPwaaBddnagsCWvxAwJeWrzlug
 drzPUpw5zzpmvhiAWhDLuVjJDYZs5rfy8poyYxf6cOc5uRw0KRMu+x1mKXPlw2Gn7ogU
 W6MCnqGP7e5BuI8mi+Qa/n/tX7VLOuPbQpVPAyOiC7SHyG2BXv6IGM6oOG2cm53UAaCe
 4bgYXQkinP2F0xnIPWy2XVpqE0EKr4DLeh7EBXqo1UYG/AOD265VLGIGHJKaTDRhZKud
 4H3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732678334; x=1733283134;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=whLrwTDQh9Q1vAtIf5Ue5wkiYoi+msqtQm0tKNkrgkc=;
 b=GxPDg5LaD0Vqbxm3jH6zMCkGVwPPkLkt9iSQbHJbxvl2as4twkr8pxI6h8q6IpdTgs
 vzCgp9UigOcvD2WyMbQWaOgYL8Up/GvgVZZ/7AQetHNfAUKRBcDUe45S9yB0QQapp/ji
 0XzjKq7en+O/plco5NlFcIun0fToT69Siyf++qtgmIlRVbJC73gB32lPIv9oaCVGcKWf
 Wpv7Q80afmqf1kJPFXT8cYcBpIGymPumU9cd4izrH1x3mIkrRo1AaTxczWJZTa8bLQBg
 6ycPf6q/9tdDRktFbSu/QtvA9bWc5qMb6nccUaH/SEtd1FL9s2jUwYpga8wrL33uFs4l
 Zcfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+OpF4DerHzXZdi6wTcHX+t6Bp27V4TqLunnWo0ULxLcTKWNzgAy7AEhhD7Q1LWM6hYXST05F/Pf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuCKEUX66PAOArxA46OcQc9n6t1U6fPu59/s903cnngRfEGhGX
 qV6zRsSDQ1ZIa9Tr8fJnr+9a5z4JRArLWFMBSxnxTG+jG29caYptSEXMcpUA4GWeoBQo7xtWAYl
 LbJsYl1/KfZ9aCMJEZtJtR05CTtM=
X-Gm-Gg: ASbGnctB4AXp2xYg4pG30Q+f+wG3b3LBVQo0BRZH0cQMPs1eMFQUBd0XrofLbfcLZjQ
 IlR2n1i19tvs3ey5k+qBVJ/etmZFr9XVyDHImrB2WPofqiONJeqxhv0m8oTyST6S5
X-Google-Smtp-Source: AGHT+IHJCdr9O45hf+S6imwyWvr7pTvHFpMglC2qsULtDAO0dw5VM3D7UbhCff2gplz1CWWQtUTkOpjnHRrkcXyhwow=
X-Received: by 2002:a05:690c:23c5:b0:6e3:b6c:d114 with SMTP id
 00721157ae682-6ef37281d02mr21558447b3.38.1732678334297; Tue, 26 Nov 2024
 19:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20241124080220.1657238-1-kikuchan98@gmail.com>
 <20241124080220.1657238-2-kikuchan98@gmail.com>
 <f0d983f7-5f60-4cb7-9522-ef4429359c52@kernel.org>
 <945786cc-1d6d-4a45-b9df-26d9335fd271@kernel.org>
 <CAG40kxH8bQHauBAd1B=UpC7LLAJoS=ETKczL=QWBKqvk=VKh_w@mail.gmail.com>
 <d1e8b3e9-526d-4910-8b15-6cce2c8526db@kernel.org>
In-Reply-To: <d1e8b3e9-526d-4910-8b15-6cce2c8526db@kernel.org>
From: Hironori KIKUCHI <kikuchan98@gmail.com>
Date: Wed, 27 Nov 2024 12:32:03 +0900
Message-ID: <CAG40kxGZ=BKU4H5D=XhzTkMYMNqEsJuHMpaTh2awVd60jCjrMQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: display: panel: Add another panel for
 RG35XX Plus (Rev6)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Christophe Branchereau <cbranchereau@gmail.com>, 
 Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org
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

Hello Krzysztof,

Thank you for your reply.

> > The old schemas "leadtek,ltk035c5444t", "fascontek,fs035vg158", and
> > "anbernic,rg35xx-plus-panel" exist independently.
> So you duplicate them. I wrote: Don't duplicate.

Ok, thanks. I won't duplicate.

They are already duplicated in the tree with their own file names.
The panels I want to add are not directly relevant to them, so there
is no single file suitable for the panels.

Should I merge these files into a single file with a file name such as
`newvision,nv3052c.yaml`, taken from the driver name?

Best regards,
kikuchan
