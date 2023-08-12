Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2027779E3B
	for <lists+dri-devel@lfdr.de>; Sat, 12 Aug 2023 10:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1DA10E057;
	Sat, 12 Aug 2023 08:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D415310E057
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Aug 2023 08:36:22 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4RNDXM1LdVz9sQy;
 Sat, 12 Aug 2023 10:36:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1691829379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/XrpGj268ANMqkjJ6sRh0UhhiU8sMWrdHHUqI9pS91s=;
 b=vmhA+EIaLrUpwMcko+AudKWsALqGC+AVYVapN/DOQXnZvwkbkGgVraQzIiymY3VgTiA9Pq
 nSU6oeH09LqyNolsW+LKFKcADoTfm0jWy2mYI1PLQE7tk009JxFVbWjvIu9Wm43F2E9iSc
 kabSb6ZoIZ1+p7puOV9Y7mkd26jRMja/qEA5C2G8XtdyZCrfKS41iWcdcu49aNTveKPGUJ
 xd0HFdnFb+hahS3qQ1XqprB7ODpOtQFu9KVASsRv8diWDFNnwJVx0RFof9G6YD/u0/Z4Ws
 5Cn/PgcI8Qpr/Oe3NTCnCGjrmN6mMU2HdOiQYbA0ZlEudE1ZvxrUFF4xx+/6lw==
References: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
 <CAGb2v64ZxaizTOLMZfJKujAZqZCiowbotxBhvfCmLV_exF-ooQ@mail.gmail.com>
From: Frank Oltmanns <frank@oltmanns.dev>
To: wens@kernel.org
Subject: Re: [PATCH 0/3] pll-video0 notifier for v6.5+
In-reply-to: <CAGb2v64ZxaizTOLMZfJKujAZqZCiowbotxBhvfCmLV_exF-ooQ@mail.gmail.com>
Date: Sat, 12 Aug 2023 10:36:06 +0200
Message-ID: <87leegk689.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: dri-devel@lists.freedesktop.org, Icenowy Zheng <icenowy@aosc.io>,
 Icenowy Zheng <uwu@icenowy.me>, =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xnux.eu>,
 linux-sunxi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-08-10 at 21:18:12 +0800, Chen-Yu Tsai <wens@kernel.org> wrote:
> On Mon, Aug 7, 2023 at 5:36=E2=80=AFPM Frank Oltmanns <frank@oltmanns.dev=
> wrote:
>>
>> Hi Icenowy,
>>
>> it is my understanding that you are the original author of the following
>> patches are in Ond=C5=99ej's 6.4 branch [1] [2] [3] but not in his 6.5
>> branch. I assume it is because of merge conflicts as the part about
>> setting the parent has already been fixed in the 6.5 release candidates.
>>
>> Therefore I've removed those parts and adopted the commit message of
>> PATCH 2. I've removed your SoB, because I think you'd need to sign of
>> the revised version. Especially patch 2 has become a bit simpler and I'm
>> wondering if it makes sense to try to upstream the three patches now.
>> What do you think?
>>
>> Thank you for your amazing work!
>>
>> Best regards,
>>   Frank
>
> Please send to all maintainers and relevant mailing lists (as given
> by get_maintainers.pl).
>

Thank you for pointing this out. This was actually intended as an RFC
specifically for Icenowy, but I forgot to mark it as such.

Furthermore, I decided to cc the two lists because I had trouble
receiving Icenowy's mails in the past and I wanted to make sure I could
at least browse the archives for responses.

I'll take more care next time.

Thanks,
  Frank

>
>
>> [1]: https://github.com/megous/linux/commit/2cd3d57adf83e2d091baed77e1aa=
fc01d545d123
>> [2]: https://github.com/megous/linux/commit/c9c7bfe22f0fefdfc1dc2ce84b45=
2964112399d7
>> [3]: https://github.com/megous/linux/commit/e19ccee10a8492535b6cda1ba97c=
ccc2074d6e65
>>
>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>> ---
>> Icenowy Zheng (3):
>>       clk: sunxi-ng: add support for rate resetting notifier
>>       clk: sunxi-ng: a64: keep tcon0 clock rate when pll-video0's rate c=
hanges
>>       drm/sun4i: tcon: hand over the duty to keep TCON0 clock to CCU on =
A64
>>
>>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 15 +++++++++++++++
>>  drivers/clk/sunxi-ng/ccu_common.c     | 22 ++++++++++++++++++++++
>>  drivers/clk/sunxi-ng/ccu_common.h     | 12 ++++++++++++
>>  drivers/gpu/drm/sun4i/sun4i_tcon.c    | 15 +++++++++++++--
>>  drivers/gpu/drm/sun4i/sun4i_tcon.h    |  1 +
>>  5 files changed, 63 insertions(+), 2 deletions(-)
>> ---
>> base-commit: 1cf5c37ee3c2334a964c65e52b4e0c59b4332d7c
>> change-id: 20230807-a64_pll_video0_notifier-164cbc78b341
>>
>> Best regards,
>> --
>> Frank Oltmanns <frank@oltmanns.dev>
>>
>>
