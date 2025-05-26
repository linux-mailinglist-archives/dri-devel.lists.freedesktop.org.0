Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E0AAC4475
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 22:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131C510E03E;
	Mon, 26 May 2025 20:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RXGsYxT0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6E910E38F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 20:32:43 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-604bff84741so1839022a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748291562; x=1748896362; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WP4BXoGsA9ZDJRd6S31SQXtGCF/J8HMMIOXgRfwjyE4=;
 b=RXGsYxT0NHpc5QZXBU6iVQGS0B34e3TN6F/1KwEG5DlJIQTVtkPGGTN9tvVfupv7tV
 PyETEb9S1WFgTa/QqrfFRyC18X03Os1dpTM60GdKlF9PSoDaOki3MEhP9mq1CDwlidSX
 yV8hqEtEzT+AOx7Jfa4gXAiQ79gYpe0bHPpMrMjQq2Mj/BuHZXucSmYgQgwPyv+TP8gi
 NEusHQsPyUI7j8ivMPyNHX9njaJcMaIRXtaXOzvSYgmQRA8uUU+sd0ANEDrtL3cQsM8j
 9nDVmwCXCbd6clgxWHNQnmJ8Txg1RRrShOJNOWMt8yeR3Uo5bsuvXLGgt9EQir6m0ICB
 QE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748291562; x=1748896362;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WP4BXoGsA9ZDJRd6S31SQXtGCF/J8HMMIOXgRfwjyE4=;
 b=c1onB4tdnwUrSB++2/xKPlrSZcwVAmXa4s5Xs+Daz2t6ui1k4onO4zzIyg8pyVzT2U
 FBlnncBArDI7/6w8Kz+Xul/kcOLsEAIY4PpidnD09nc2LJB6dDkBeOfm4HMLa0LgVslj
 vRIhVgyNJz0MxTlQk3LERHC7+WautL07nn/ThKsIcPjnuf9TvTQ5YIZaCxUQLApCw0fK
 vkkRt0fREIEB9BFjguzgHbHLHPoZsQ+HZcIFNR597THZOIU4KXpj2sEkekxIH3imJ8o9
 5beN9hwCCQa6whstH0nsXUpQNwqyeqCD21YFPeYgPsLj/3DRPAKSixs6UfCDFrmV0A95
 QcCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU7SJG3R+5Qvqr/yjSBxzfrQvYsRDym25GfdkhbjVW4NRmvbiXPrHhpLK5iKdmhZrCN9l9iDk2TTo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxf8A4DVLJhp92DPhVFgBjanXhTZowdD5YnD5J5A/8t4M8EHbB
 drFhlA73tf6dXU7FTGgDYT1kX0bpPSlkjSRQbxO/oi8kBCW2Gnv5DFAgV9seHuq/9TG1nYulC4+
 C1kDAxJiyVwY0wJcAbMYfaxl6IKZp9Lw=
X-Gm-Gg: ASbGncviJNE5B2/rBkv18IEKn7Idd9HActdIkKHircWxLE+zywNbysjf9wK7DbnALoM
 o6/EEkzQAhRZJ2+gL05WoEmYr7vNoL4n2veYDLYjxUudOmJvFZBm/vJqx6askLup++7ce8WqSHQ
 0vOwJXzntxICQtbuRIOfck+DqHZ5C6DVg=
X-Google-Smtp-Source: AGHT+IEyfhvaP1gQ40YupdljtimUDGtXfd/lwbXtT+yq/yOGZdkhQkLysV7LOFxJzTjOml57IndyPYX5LzrGUnzecrY=
X-Received: by 2002:a17:907:26c9:b0:ace:cc7f:8abe with SMTP id
 a640c23a62f3a-ad85b1206d0mr897551566b.31.1748291561569; Mon, 26 May 2025
 13:32:41 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 27 May 2025 06:32:30 +1000
X-Gm-Features: AX0GCFsWWNR6-PxORypM_dxajAgWx-reqo08nEje1227s9mSRBa12glGf9UtplI
Message-ID: <CAPM=9tyJgHPp5N6XpauFRL1hZDLCG8L+9Gmi7RCLRaK4BN4tzA@mail.gmail.com>
Subject: list_lru operation for new child memcg?
To: Dave Chinner <david@fromorbit.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, kasong@tencent.com,
 nphamcs@gmail.com
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

Hey all,

Hope someone here can help me work this out, I've been studying
list_lru a bit this week for possible use in the GPU driver memory
pool code.

I understand that when a cgroup goes away, it's lru resources get
reparented into the parent resource, however I'm wondering about
operation in the opposite direction and whether this is possible or
something we'd like to add.

Scenario:
1. Toplevel cgroup - empty LRU
2. Child cgroup A created, adds a bunch of special pages to the LRU
3. Child cgroup A dies, pages in lru list get reparented to toplevel cgroup
4. Child cgroup B created. Now if B wants to get special pages from
the pool, is it possible for B to get access to the LRU from the
toplevel cgroup automatically? Ideally B would takes pages from the
parent LRU, and put them back into it's LRU, and then reuse the ones
from it's LRU, and only finally allocate new special pages once it has
none and the parent cgroup has none as well.

I'm just not seeing where the code for 4 happens, but I'm not fully
across this all yet either,

Thanks,
Dave.
