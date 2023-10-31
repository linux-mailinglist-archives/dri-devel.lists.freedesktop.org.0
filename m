Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D867DC61F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 06:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5293D10E402;
	Tue, 31 Oct 2023 05:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDECF10E403;
 Tue, 31 Oct 2023 05:52:24 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53e70b0a218so8275145a12.2; 
 Mon, 30 Oct 2023 22:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698731543; x=1699336343; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z58vdGjJl9TiXF4P4hhMJUvoh5uCsMYWRpObwXO4iI0=;
 b=NmtlRGFvWmFCge6ZN9cIqBtNJV5Mw9t6w7u8u303R26F21cFpGJS+j8G4ToGUQ28Cl
 1KRrCjuVpR0ty4EfQxs1wpfaJS2C9tUQ1SiGbpeb6DNcocQ7wfMrzew7C7e/gHyXa90T
 4YwM4shk0ID2y2KilRgumq5xKUU/tkTo5CKTloCOLygBY2VwgzPC3wMO8bJJbE5SAy5y
 18lLHich6gk6MVXt1+aMbg2KTLAHqLrW8Z1LUN71Mcd8Xh5sdJ3gt7+06uemyropVLw+
 VebEKC6EHM2NkgpC0HpI5ahdMLJavpLjuxK6b2IyYjU481wE8I4J3P9ppUTIV0FInh5W
 lYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698731543; x=1699336343;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z58vdGjJl9TiXF4P4hhMJUvoh5uCsMYWRpObwXO4iI0=;
 b=ZarprVDB2Z3Kn26T546ucnfygUaLDjaDA8ICihB/W8xJysWMstwOIbrj6roeXF+WxP
 6H36hJnvjq5cl7Mc6bsctGwcQ7YeCK6pFRZhqfpi8Cttbk7LeJPBbyots6f6KhRLNxfm
 uBHXyG1gcYrJblVMzKq+I6QyD6l4LOmgfYqIsO6fAxDxX38mYDxBBSEYR72byvbi82Vs
 gJu/5DyxgvpQdT7Sz7DaHX0j8A85mYqxvHNL1NPw/MwgGd0zm0UMDnxfEGDSPnuPTRnH
 +kAvBgAqDUqlu0B3ZJ/kzywT5vakn0S9P+pxUW6HjyKoq8f+9Nc2N0hS0rUDRiHR6ZgS
 GkJg==
X-Gm-Message-State: AOJu0YyrgBeaM1qXF5t1mmZUf0AxDE5W9TxHptOuRIHcZJDSGpMIzFjL
 Wvqmo3cJm5NY9i0C95w3FjLDiPpsMcMeqUrb03/vN+Hm
X-Google-Smtp-Source: AGHT+IERKSleyKiRDOvnkxmEf9IEoxMRcGi4h2bLg1JSNLj7DZBhT1YoBsVCmJOtC+WtHuJnVUv0sZM6xhw0SlHLu7w=
X-Received: by 2002:a17:907:31ca:b0:9b2:b153:925 with SMTP id
 xf10-20020a17090731ca00b009b2b1530925mr10355937ejb.21.1698731543178; Mon, 30
 Oct 2023 22:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <SJ1PR11MB61297BF7764AF1207571A872B9A0A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <CAPM=9txw6gYP+GoBvMBCWAP_W6_LSYg6SnHXQ9w1EjxA0UoOvQ@mail.gmail.com>
In-Reply-To: <CAPM=9txw6gYP+GoBvMBCWAP_W6_LSYg6SnHXQ9w1EjxA0UoOvQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 31 Oct 2023 15:52:11 +1000
Message-ID: <CAPM=9tzRY_UbddDSmfFP_Bi54HkB3m0F7xwNcO8J5pibuyZBhQ@mail.gmail.com>
Subject: Re: Build broken in drm-tip
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>, "Kurmi,
 Suresh Kumar" <suresh.kumar.kurmi@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>, "Saarinen,
 Jani" <jani.saarinen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 Oct 2023 at 15:23, Dave Airlie <airlied@gmail.com> wrote:
>
> On Tue, 31 Oct 2023 at 15:09, Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com> wrote:
> >
> > Hello Mario,
> >
> > This is Chaitanya from the Linux graphics team in Intel.
> >
> > We are seeing a build issue in drm-tip[1]
>
> Sorry that was a mismerge from me, let me go fix it for summon someone else.

Should be fixed now.

sorry for noise,
Dave.
