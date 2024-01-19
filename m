Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9F7832E40
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 18:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7ED10EA16;
	Fri, 19 Jan 2024 17:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE67910EA16;
 Fri, 19 Jan 2024 17:37:13 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-50eabbc3dccso1398204e87.2; 
 Fri, 19 Jan 2024 09:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705685771; x=1706290571; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2w+PlFBMDzZDn8jSXWaYpKXaOEHUX3N/Q0dtl+FJW1w=;
 b=Vn8lyagXGJ6Z1snr2V2JuI/Y8ypm4ui6aokJ+VZtMUWSwUoaR5JjqYQYjdlI9x/SZw
 ewUqSizYUlkVvBB1AOWlJx8PPUl8e0s6LlsY1vntN2EgsNe6I54uQ1/7jlqemZ/PrmGI
 1EzxoxsZP3uqEAmMp2Rp7Tc8vrkrva6VpAF553PDxjT8Ab0jx98ExHmHseNtuAYjke0y
 YhXsORvDQjqbUEKEYvxvfmA1DBnBsMU58RowhZhYaDBlf3NZ0JTkYwwu2pk4pajwhpKA
 17QH3LV3eg6GkKJV6nPeqAsTlyoPe0WqCn5gvkmoCh8L8v1y75XEa+XZ47k97mHdlSEV
 JxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705685771; x=1706290571;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2w+PlFBMDzZDn8jSXWaYpKXaOEHUX3N/Q0dtl+FJW1w=;
 b=iparallGJEtIlLKyM6qDZJYeh70kCXYasVOxb5TTZv/b7SMHPDboHImlorfUGfNW6k
 bCX1DFgmP2tVchWIE+fJqIhFZzLf3tIlNkovk5ouakIYB1UrHKOx40L/MhcEKLc/v2Fp
 uy3pqzacVxhZ8t2vsRNok+ZVKkjhwklBkVpjq4ojKU4acEURPA3QEEBevZ3qyyWo19No
 lSZGovApPC0A/ySGAPXoscFLnGCkTpeIT8baa3GLi6B4VeJ7YYhGeNLeSgVzPF9Qu3ib
 vo4fF6EZhMtm0/bXwTYb0LiUD/g8DND4m/QEi8nXNs57cFSql9Ux5TvRGuah61QVlT2D
 OMyg==
X-Gm-Message-State: AOJu0YxR7UgsqI4TYaFIGhq2ZhduIKnw+LZIY3KX/Ltk9RRzhRhB7qS5
 Doqqx8hp5J9FoUOCasRlMvdEB1hZhzdNN4ESp0sGnBjO41P6MpDn8/6pvmgfi/WvvAstRJliC1i
 miRfbIx1yN5Mc6zpxvQgksEY+blo=
X-Google-Smtp-Source: AGHT+IGso8EMMKPEkmc0KM468Ws02S4bJ1diNnwaa9Z9ud04YeInDBuTuoklswepJ9JGfCb+8Ys22GUrDg7EQJxtniU=
X-Received: by 2002:a05:6512:3c94:b0:50e:d4b4:b3f1 with SMTP id
 h20-20020a0565123c9400b0050ed4b4b3f1mr5415lfv.154.1705685771118; Fri, 19 Jan
 2024 09:36:11 -0800 (PST)
MIME-Version: 1.0
References: <20240118123752.bl3qss3qbbxgvpdk@suse.de>
In-Reply-To: <20240118123752.bl3qss3qbbxgvpdk@suse.de>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 19 Jan 2024 12:35:58 -0500
Message-ID: <CAEdQ38GM63O2Y=1UR9wX0PTTGyZuZiT1NZyaVwSfnFuG8eoqFw@mail.gmail.com>
Subject: Re: Mesa >= 23.3.x and python 2.6 ...
To: Stefan Dirsch <sndirsch@suse.com>
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
Cc: mesa-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 10:22=E2=80=AFAM Stefan Dirsch <sndirsch@suse.com> =
wrote:
> I noticed that with version 23.3.x Mesa no longer can be built with pytho=
n
> 2.6. It still worked with Mesa 23.2.1.

For anyone who got this far and was completely incredulous... this
(and the subject) is typo'd -- the problem is about Python 3.6, not
2.6.
