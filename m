Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5889C69022B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 09:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1972B10E947;
	Thu,  9 Feb 2023 08:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B660F10E07A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 08:36:21 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id g13so13678306ple.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 00:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YQcbgnDlHKYOJgsAhKxnII8M4sIuLHWxcHMsjPslWCg=;
 b=ThD+VOWH/B7VeJupYpsZU/9zxKZKVeUtJ1b3aII2jX4IRQ5nKcJddAQcyRYFHaJkgy
 UZDwScA0UsmycCs5VvnBx9aw0vvuqxRQKeNou17XUpU0CCBzxj84nCDXqHvQKSOFq/OA
 kfavdCZmTo+adIpNy1JO+hd8weAL/aCsSdiuD7Nr8fUvcvYxFycLJ6l0TseIzYOwU923
 5TnSZhexv9ibQluLZrCArew8fujsXW9s7dtYS3yyd1H+23WIG4XRvQN29NkIwsXUsQAg
 NFB1ugaYNB/vNTtg6WPGW8DHWPeXqShUtbtXphdZ0jDrQkcB3lxNTWZ/4nbaUHqZAVWV
 69Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YQcbgnDlHKYOJgsAhKxnII8M4sIuLHWxcHMsjPslWCg=;
 b=6QObkdqrHSlYa2DipVniPFTWy91gv5aMXE//zE9z2TNUuDOvOQWx+b5fbQQXcKgU35
 3L6Khq4LypDP1JVow1ZWJD6OY3UexCC6hRgmntDIuthYFbWy5zNBeB+shH0GjGsuRo+4
 iolrVKcfezjNif3SJmhzxp+Ey9ubuFdIkwXXEGcon1rqK8XD7HASWaV3hv+AonDN0hrX
 6hVhanfbku4v//bwYHAjNL4+wXQ+E74mErKAYhVz8Ch3rQ7GpwLAF/tz+sB7+YB32CBa
 HWAwh9jbs1Lfa2HC0pLqri4m70+wu3NLewecyDWYC26cs6HBWRPIY1YP12zt5164xZSA
 6qgg==
X-Gm-Message-State: AO0yUKVZhi4i0l+MyKoYatWAWPKmrU+ya+FV9yjWnQelRzSNcRsPwn+X
 szYbhTKIVLk+rH8r8Gf7a/8=
X-Google-Smtp-Source: AK7set/vvbz5CVOvtbpPqeaFSlmt9PdgHsAxl8h7pHqMqTOUj6/eJ+FF05Nj6kqmS+kEDZJi5vPIWg==
X-Received: by 2002:a17:902:e491:b0:199:2c02:3c08 with SMTP id
 i17-20020a170902e49100b001992c023c08mr4689260ple.17.1675845381250; 
 Wed, 08 Feb 2023 00:36:21 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp.
 [106.167.171.201]) by smtp.gmail.com with ESMTPSA id
 k2-20020a170902ba8200b0019258bcf3ffsm8728532pls.56.2023.02.08.00.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 00:36:20 -0800 (PST)
Message-ID: <6e947a02-ebb7-8a3b-f0f4-87684cb73e6b@gmail.com>
Date: Wed, 8 Feb 2023 17:36:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/7] media: Add 2-10-10-10 RGB formats
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20221221092448.741294-2-tomi.valkeinen+renesas@ideasonboard.com>
 <12250823-8445-5854-dfb8-b92c0ff0851e@gmail.com>
 <234cee3f-3902-16d8-8fb7-6d79749d9379@ideasonboard.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <234cee3f-3902-16d8-8fb7-6d79749d9379@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 09 Feb 2023 08:30:13 +0000
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
Cc: kieran.bingham@ideasonboard.com, dri-devel@lists.freedesktop.org,
 nicolas@ndufresne.ca, linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Feb 2023 09:56:24 +0200, Tomi Valkeinen wrote:
> On 08/02/2023 03:53, Akira Yokosawa wrote:
[...]
>> Tomi, can you remove those extra "-"s I mentioned above?
>>
>> Hopefully, this can be fixed before the v6.3 merge window.
>=20
> This is all black magics to me... Why does the same format work elsewhe=
re in the file, but not here (I just copy pasted it)?

I think I know your feeling...

Let me explain some background.

The directive "flat-table" is a Linux-kernel-documentation specific
extension to the standard "list-table" directive [1,2].  If you have
inconsistent number of elements in lists, they are not regarded as
proper format list/flat-tables.
Sphinx builders are not strict about them, but in my opinion, latexmk
(or an indexing utility, in this case) can't be blamed for not accepting
resulting .tex files.

This is all I can say.

[1]: https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html#list-ta=
bles
[2]: https://docutils.sourceforge.io/docs/ref/rst/directives.html#list-ta=
ble

>=20
> Oh well... I can send a fix, although I don't know why it's broken =3D)=
=2E

Thank you for sending out the fix.

        Thanks, Akira

>=20
> =C2=A0Tomi
>=20
