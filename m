Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 858A1B13497
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 08:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C623210E0BD;
	Mon, 28 Jul 2025 06:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="ERkINV3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5716010E0BD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 06:04:35 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-31efc10bb03so370947a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 23:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753682675; x=1754287475;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W8TIM/uSluixO4ZsvTxwh9SnRtahNK26geaW1rbU2HU=;
 b=ERkINV3lpyz362ge6Zk6cUlLhZ9tZhL5U4EaiiHk2cBo+wXyWoAti07EEH7GecK7F6
 AfJtQfCR9cqo65t2gmiRFbVvAs593ggIO/fq+vb9BCX4ECWyrlTUswMEbSTdPVyU4H4a
 Iw6HIJCNMdRwcCa9aasKTvUQlo5SWpoKz855ZlV6HjmVBC+xqOqchHKOGk0Tfzct3J8p
 xKkQ0sCi2FYmy0rDXcFd4Fn//Aut4z9BKvy3iojCeoU1LxbdZ5/cRN9LeGiHgyR7aOp/
 u4T/91ta8E9qwjpjxIrVqBH6b5Z+i5b56xGUa7wRhSL6ZF7LMnx8uLbPDjIXOhkpP/49
 mXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753682675; x=1754287475;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=W8TIM/uSluixO4ZsvTxwh9SnRtahNK26geaW1rbU2HU=;
 b=cKoLtfzWGtys3ZXSe0qij2dCtUhUbzw1cNndhe6WN9ruHZXXjDj83c3tc/z/9hVU3A
 SNLLBuxFxmpKbDT8kc+CfzmnVdiyixem7U/5NBMjXTpkolMF9MiXwiKM/oEXhk2rUKmb
 5sFdJAJOy8V9UK5smzPgkLiqv3oddN1UIXJmXMx3VrT65hWL0RZA2XCWw0RQogvGJh0V
 Mq0PkWbyPersFDJ82ItJp0ZvMyb5Ym4oxKgNcnshYSqdn8s/3JOEbtCRjJ6d5mjAn4rp
 MdCxR2si5S3ee346m56PfAnoAa6dbFT96O7yjNE7DICfT9B70tgm2RcFkcUdVXnhso2g
 2vqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtGnYz8VMZsgO0dlgl4Mr4a1wQgArLSjEsG0ivnakmZfIlDryLFa9y3KINt4qrpc3hGYNNOKvW9nM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhcxx6OkQ6hA2McsIB5znc1n8g49UedsSMGEtKxnqtFMgvN7mI
 gZxkxvwlZ1sepBFYL5e9JPe7+q41qAV4r7y3F4q+0RsIebikXENIvm1C4l/jdRbvnvY=
X-Gm-Gg: ASbGncsuBhaXc7RKdZtHAZULnJygadG2NwPvnzdfB5lf4ORI38QLDmH6OH7gX61lzaT
 BIpU6D/+ut3dg5CWSVBd3QALy220+SGrFHbuvL8y2ILy53MRYFo9H0biLBCOCXTNS3mygqdCo6R
 LbUbDJD+b9iuS1gezGhQzTm3eGS/tuaylh580voU7gb/lPuKFu0015A3EDtdFJ1xQjpLUtCl5S1
 3gWwUAk6SMFTdghyCneQNi6oXwLKC5sz8rKjvGjNnKDpyc1LFsnANfvmC+xiCYK60HzZggeG+ll
 l+y/JmQ3jBOIxz/mi1Wg2wvvrxip8V/PC16gte1Mvd+QIFjJjnPJvR0cZGo6CFZJZIRdmFy+TJ4
 g/MgDvn2vuiOQ55I3pq8=
X-Google-Smtp-Source: AGHT+IE7a3uEkAL5faXj3D0sBZPBBYHiZvFmLCc83UwVWA0SEZUuwxE6gkHZtvmEceEe841TShqa0w==
X-Received: by 2002:a17:90b:2d8c:b0:313:b78:dc14 with SMTP id
 98e67ed59e1d1-31e77635171mr16398777a91.0.1753682674660; 
 Sun, 27 Jul 2025 23:04:34 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e83545002sm4811767a91.27.2025.07.27.23.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jul 2025 23:04:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Jul 2025 00:04:32 -0600
Message-Id: <DBNGMHS14LUB.3PDFCB3DI1789@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linus.walleij@linaro.org>, <neil.armstrong@linaro.org>,
 <jessica.zhang@oss.qualcomm.com>, <sam@ravnborg.org>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/panel: novatek-nt35560: Fix bug and clean up
From: "Brigham Campbell" <me@brighamcampbell.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250724202338.648499-1-me@brighamcampbell.com>
 <20250724202338.648499-3-me@brighamcampbell.com>
 <CAD=FV=UGNN68Fu4kJQQ8jO+fYP4qVJYmL0quxa_=Y5GEtS-jMQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UGNN68Fu4kJQQ8jO+fYP4qVJYmL0quxa_=Y5GEtS-jMQ@mail.gmail.com>
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

On Fri Jul 25, 2025 at 3:17 PM MDT, Doug Anderson wrote:
> Hi,
>
> On Thu, Jul 24, 2025 at 1:23=E2=80=AFPM Brigham Campbell <me@brighamcampb=
ell.com> wrote:
>>
>> Fix bug in nt35560_set_brightness() which causes the function to
>> erroneously report an error. mipi_dsi_dcs_write() returns either a
>> negative value when an error occurred or a positive number of bytes
>> written when no error occurred. The buggy code reports and error under
>> either condition.
>
> My personal preference would be to code up the fix itself (without the
> multi transition) as patch #1. That will make everyone's lives easier
> with stable backports. You'll touch the same code twice in your
> series, but it will keep it cleaner...

Oh, this is good to know. It makes sense to me that a lazer-focused bug
fix would be less likely to conflict with other changes in stable
branches and would be easier to resolve in the case of conflict. I'll
just fix the bug in patch 1/3 of v2.

>> The usage of the u8 array, mipi_buf_out, in nt35560_set_brightness() may
>> be a little curious. It's useful here because pwm_ratio and pwm_div
>> aren't constant, therefore we must store them in a buffer at runtime.
>>
>> Using mipi_dsi_dcs_write_{seq,buffer}_multi() in place of
>> mipi_dsi_dcs_write() gives the added benefit that kmalloc() isn't used
>> to write mipi commands.
>
> Ah, this makes sense. We've seen this before, but I keep forgetting
> about it. Thanks for mentioning it. I wonder if it makes sense to have
> variants of mipi_dsi_generic_write_seq_multi() and
> mipi_dsi_dcs_write_seq_multi() that take non-const data. The only
> difference would be that the array they declare on the stack would be
> a "const" array instead of a "static const" array...

Ok, I've thought about this one for a while. The problem with my patch
as it is now is that it uses a u8 array, mipi_buf_out, to construct MIPI
messages and send them out. My patch reuses mipi_buf_out because it
happens to be the right size for both messages which need to be
constructed at runtime. Not a super clean solution, perhaps.

The Novatek NT35950 has a better solution. See the following function
from drivers/gpu/drm/panel/panel-novatek-nt35950.c:107:

static void nt35950_set_cmd2_page(struct mipi_dsi_multi_context *dsi_ctx,
				  struct nt35950 *nt, u8 page)
{
	const u8 mauc_cmd2_page[] =3D { MCS_CMD_MAUCCTR, 0x55, 0xaa, 0x52,
				      0x08, page };

	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, mauc_cmd2_page,
					ARRAY_SIZE(mauc_cmd2_page));
	if (!dsi_ctx->accum_err)
		nt->last_page =3D page;
}

The driver has a couple different functions like this and they're all
for the express purpose of writing out a single MIPI buffer which is
constructed at runtime.

Arguably, a more readable solution would involve the definition of a new
non-static macro like you suggest. The macro's `do {} while 0;` block
would achieve effectively the exact same effect as the functions in the
NT35950 driver, causing the buffer to be popped off the stack as soon as
the code inside the macro completed.

We could call it mipi_dsi_dcs_write_var_seq_multi(), perhaps. Or
mipi_dsi_dcs_write_sequence_of_bytes_determined_at_runtime_multi()? ...
(Help! I genuinely don't know what I would call it...)

Please let me know if you'd prefer that in v2 I adopt the approach that
the NT35950 driver uses or that I instead introduce a new macro for
non-static data.

I'll address the rest of your comments in v2.

Thanks again for another thorough review,
Brigham
