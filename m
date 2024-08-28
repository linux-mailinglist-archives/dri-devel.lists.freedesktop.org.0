Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA8E962806
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 14:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CB610E507;
	Wed, 28 Aug 2024 12:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="APf48aTN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC8710E507
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:59:01 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5df9433ac0cso57203eaf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724849940; x=1725454740; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pH7WFnf9Z5U9s40gHaojKFntzdW0wQvoSDRbtMTVsPI=;
 b=APf48aTNw8eRvtnCBPwpFQFNWtaEpBLxaMkkR3oFbMhx6ZhC+C4QipoeE7xshAj7yP
 8dxBQZcV6TGB5iqE5Gb614357ciQeFeKu19jRSQxwLjA2YRAMDkJRL2FwAzpkKYXANyc
 zqtQU0cA+hlVnSQrP2bhkYrT7SeNI9hhHn8kxwgiKUk16v5AUffDx3HqvQGh+QBxgx1a
 2fmg5bVXumbRFql97jCW5F6HQtH9Wv5qCKARM5Q2X2J06YRQ7zWcOV6iQHUwInqAm1q8
 SFCZKz4wKmOn1kAnVdUp/UAsitCK+TluZWKO6qiJas9GSqnXBt5mJqSXEOP4H+RCwJaV
 n9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724849940; x=1725454740;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pH7WFnf9Z5U9s40gHaojKFntzdW0wQvoSDRbtMTVsPI=;
 b=J9VgnH/W43B0DpfPlJaHJgg/vVrn8DQs86dWpPXBPuhZ3IpGFduJnboTEOhuMXOaXH
 8sfm5pS5TfKxBIwTvu6Ze3zt3jhgLNtSWMaEtINT7zxH4dEd+DfEjHYqiXS57HecZirl
 px06qvAlo4oS46midRmcWJilYQ0dt5l0ibd7rktcIZKy+be5kkcW/KdPdLbK8czCBaCH
 9TOu7PasfEcGZpqbmxAEa+ofH5RLrhVJfCBcDN2BlDIQbpwbyYl9Ik4FElxYopdj0t1i
 eFt61G4wct+vZh/QDE8uQSQ+fk9dr9rarpQoQo/6wkutwDbJS8m97UIY1ejaRuSbQpnF
 xJ9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI8FX813qXdJsHD/RHqrKlScMMdBIYuBHiPHn3eqhX9BpLdBdOy67M+mtNOUGMhLOymoGxZVtQqkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2wo1ZO+YYQOJiGiDfdteJj7UocGf5Py7OhvZdtvgLDgZfo3Xh
 7NsnIv0B2L3EW3gAFZqOVu1ud6YIMZLpP+ufC9HsnPFO8akPdHtxUBoBEt75iwQhyCsjv9ryImm
 TFoYJD7iBC3qhyZ467mvmddvRJpxkLBtbHpQ=
X-Google-Smtp-Source: AGHT+IH+dDHakcMPvkuKOsY8mULW4jaimlsccjCHmLOHF71l0LdgzI569jfkq53KV+Wjzqed0wUcjeuwQ65gQxSdFXk=
X-Received: by 2002:a05:6820:1611:b0:5df:8577:e7b with SMTP id
 006d021491bc7-5df857711e2mr1981136eaf.0.1724849940444; Wed, 28 Aug 2024
 05:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240828030321.20688-1-laoar.shao@gmail.com>
 <20240828030321.20688-7-laoar.shao@gmail.com>
 <byi4tx6l2lrbs5w6oxypr44ldntlh4kp56vnsza3iuztwb37oa@2qtdx2kgz4bq>
 <bbdhr62fk7jts6b4wok6hpbjtoiyzofbithwlq7kl5dkabn3bz@3lf47k4xrmhc>
In-Reply-To: <bbdhr62fk7jts6b4wok6hpbjtoiyzofbithwlq7kl5dkabn3bz@3lf47k4xrmhc>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 28 Aug 2024 20:58:14 +0800
Message-ID: <CALOAHbBC=2g0R=zM0iNXexMzaJq5rKykM=4rSGbNLLwGja1-HQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] mm/util: Deduplicate code in {kstrdup, kstrndup,
 kmemdup_nul}
To: Alejandro Colomar <alx@kernel.org>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, 
 justinstitt@google.com, ebiederm@xmission.com, alexei.starovoitov@gmail.com, 
 rostedt@goodmis.org, catalin.marinas@arm.com, 
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Simon Horman <horms@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>
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

On Wed, Aug 28, 2024 at 6:33=E2=80=AFPM Alejandro Colomar <alx@kernel.org> =
wrote:
>
> On Wed, Aug 28, 2024 at 12:32:53PM GMT, Alejandro Colomar wrote:
> > On Wed, Aug 28, 2024 at 11:03:19AM GMT, Yafang Shao wrote:
> > > These three functions follow the same pattern. To deduplicate the cod=
e,
> > > let's introduce a common helper __kmemdup_nul().
> > >
> > > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > > Cc: Simon Horman <horms@kernel.org>
> > > Cc: Matthew Wilcox <willy@infradead.org>
> > > Cc: Alejandro Colomar <alx@kernel.org>
> > > ---
> >
> > Reviewed-by: Alejandro Colomar <alx@kernel.org>
>
> (Or maybe I should say
>
> Co-developed-by: Alejandro Colomar <alx@kernel.org>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>

I will add it.
Thanks for your help.

--=20
Regards
Yafang
