Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A9F85E06D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 16:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A80210E074;
	Wed, 21 Feb 2024 15:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=munted.eu header.i=@munted.eu header.b="TYSaZWMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com [46.235.224.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BBB10E074
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 15:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=munted.eu; 
 s=mythic-beasts-k1; h=Date:To:From:Subject;
 bh=23Yk6MivlQfe0pNZa5XtMtw0a4JqHjZqJjNsUpSu7vM=; b=TYSaZWMMzq9qbGIAfCN7P0FYOv
 xA7IZUOyMo3WrIyLQhBkPL1HSuxJhjfwHhUIiDlfdr0/Yr5xTs8RHXQMLHo8zFkrUQa5ILML1MLDe
 pxWg6AxiTF66CbPMwd7UeWfkwL5EICQMLFeigpK3jWX7jOYvyqhLX7dpXdWBraxqQzDwe/G0fpHTP
 jK5YkfGGEzgHBhlxEe5Q099WuAP9WWCaJjHApSWAEYq5hENPFMlkFDanBoJpNQS+t2ZqSTpUbwS/Y
 SH4FR7dRx73fIvGzhvN0WquypKwCofEnxDP3J+0VmYOjiDACc+O1RZn2N78420/sj7sDEBH5ifx8C
 RaYMzhPQ==;
Received: by mailhub-cam-d.mythic-beasts.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <alex.buell@munted.eu>) id 1rco6n-0041WF-Nq
 for dri-devel@lists.freedesktop.org; Wed, 21 Feb 2024 15:02:05 +0000
Received: by cobalt.buellnet (Postfix, from userid 1000)
 id 008346F26121; Wed, 21 Feb 2024 15:02:03 +0000 (GMT)
Message-ID: <1e22f3b1a03c84f2be08de0e5807fd7a34cc64cd.camel@munted.eu>
Subject: Nouveau issues with  Quadro T2000 Mobile / MaxQ
From: Alex Buell <alex.buell@munted.eu>
To: dri-devel@lists.freedesktop.org
Date: Wed, 21 Feb 2024 15:02:03 +0000
Autocrypt: addr=alex.buell@munted.eu; prefer-encrypt=mutual;
 keydata=mQGiBESBdzQRBADZG8wvppAgI8NwvsAxedwBtLw7q6JjAisK91A7pF7zNpHtEHQhN4blBelLYHE48l12D2HzmMM+ZsI7cMCT/iOo1HdvWILoyg5nLNh2owaRYspg4DZRee4KefYrhyEl96THy19VK09sXAe42tmtZJNo+OJ+0lkPEapStyIlSJrHiwCggm70g64yVDu+47pBXvfLn8tifbsEALbT65XgZPETlJ7GWJAI82X/ZlaUx7EOMXKxX2LzWFJEadbHXsKi3zlKuneNGU8pwQNHVXN0wfHi/kRw5f4TrButZl4kDK8h3sP27awLWXHPCTfJXEOzihvmBdX23JcvXMWmGwI+5nzlSUj5jXRj8QFRxGrwbGEK1yHms/ja9cbDA/9+AOrHttUrvRSovBrt0XGCTxjBswtTnpZjfCJv8RdvAWfhaGxf7gz7kAlNRnQI4N8Uv0QT8uPy6ZHdabyPW/8WsOxdWXwLcfExDvx8PGzn2Z6z6mjV9ziVp2xco0nzs7wneHqnzSgZLgoFg3Yy49MpDJwGEfQnANjnAhonW9z+x7Q7QWxleCBCdWVsbCAoTWFpbiBFLW1haWwgQWRkcmVzcykgPGFsZXguYnVlbGxAbXVudGVkLm9yZy51az6IXwQTEQIAIAIbAwYLCQgHAwIEFQIIAwQWAgMBAh4BAheABQJTXnyNAAoJEBP0zXMUgl+OIdUAnRLVsqLvC2OcDnSl0AqFqLnuX+MmAJjf5M0x826cEjl7zw1YyDhgn7qdtCFBbGV4IEJ1ZWxsIDxhbGV4LmJ1ZWxsQG11bnRlZC5ldT6IZgQTEQIAJgIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheABQJTXnyNAhkBAAoJEBP0zXMUgl+O+RoAnj1uoAheC30ecr4yoh6avHEhL/llAJ9Qo1iwHVMpXRRhK+cHvRXKpfrK57kEDQREgXnxEBAAySb93hrH28AtA5sPE
 pwF+Chy+xK5KISe4f7HJQpwWNgPCFJVFfldNUJdk2skCeFlmHCn81fzVx1tewE0xx6nsqPgBugjIukmY/14jp4ysr6g+xqxMhdQqW1gPPssuztn8GEk5c/nLr3R3uZYoeLNxWxGOm0agpepMeMduFHcVQWqZ2UwgOcg1ytPtedAzyyQzbNuxENIPj/SF9jCPoqZJlN8eh3p8m2HuWp317YA8bUD/f+wJDvqADraxjXr2Nq0YRdgTr/+ajQdHJx+j4jUary0FM2C9I9jlljdb776uYr5qo4Ame9I11f+/g3IiZcIejRDqd5P41JjzzEX+f5wLpqvdHC/i8940bbhE2wi+Gh+cTOX25x6zRtb0uxzPsaLhCdOAEcZvuK8afKyNo0/Ptgpc/qO5p+EdY4mX7KIrbCKADobzlO9Ny+dSaY7/IGJIXASjPunQlBsMRWixzEe6I/zKUAmjCEW1La9nOmY/9r37rfY0yRS5HdDzZLrZQz4UdtdK7mkfFAPpdT0BIRoVYo8VbtPwgqCAm3h7lcbEjSmmzzxBcp35jQmTkJl4yszgYG1c+IQ+YSeqmMbdqdKaSMU3fq0agCJGvQzOAzSEt2wClXBzqBU0lH7/rfLh5khk/BGYLbCFRkNypZdcbi+Dim7asXgEvkkwfyySbmux7MAAwUP/2cja0PGvAfwr3Z+LifcVZa+b/Zn4Ro+FxgJ3TKwWk8i9L5j4xPErwDTucnhEAoBtv79wfFlpo/iKUuMy4Jcs/d6iWz+8TFQRHB3xzPZqAYvMxN9bzlIwSVnwrvi2ocnwiZZqA/KZo+a9i1Q0R/1I19fwXQtuYEW0dWyqdxS4NdUUIujEf9sefUiRVhDXe3ra2g7W2oOmRJJ3kDGZpM8wKNIwyQeHlVjuPVdwEOyp8xCZqPIAWTWl6CdcLi1m5sO0+BRQjCqkv8wdQODgheQ3qeHRQdrag57tSJ3rtmnvQgz2/Ref4q2mk478/fHtskGyPauhn
 oM21NnHfo7RohDWVnYxAbHrErJjrym5yRxgWN0ccrsoeza/8m+G+my78KFVUtoTn9QmDDtaHrp7I2XGZ4r8rpvtCBxg4IFUqHg0ESI2/4pHw8n4uyD9e7yuZ+0zsLzMhloNEZ8ABe2/peVeir9eEVGqXTmixiLgVvPkTBi6xa4FmTqG3m0woUz8BXzCT1hoHtTPQ4UxGgcp8ITPUy1dJKUsqqY1uPSuLA06tGPQj7w/0j1HTuyct5NNHFDpDvrQdi/qr4CEk3WVWAEiv+d07DumSKnb6k5OySXSK128/oE2FXKsM1gNgFpK2SqEqfylxpAtJmRWNcV7Dyaqci22xRgBnU9X5iC2N9eXvaliEkEGBECAAkFAkSBefECGwwACgkQE/TNcxSCX46DQQCdH57pYA1kE373R9WsUN6+OXpqD8gAn0oKFduLKG48YhT7256Jo/7ZDeSU
Organization: One very high maintenance cat for company
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
X-BlackCat-Spam-Score: 0
X-Spam-Status: No, score=-0.1
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
Reply-To: alex.buell@munted.eu
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

System is a HP Zbook 15, i9-9880H, 64GB RAM, 2TB SATA HDD with a T2000
Mobile GPU, Gentoo is installed.=20

I keep seeing the following:
Feb 21 14:49:13 cobalt kernel: nouveau 0000:01:00.0: fifo: fault 00
[VIRT_READ] at 0000000000019000 engine 0f [ce0] client 20 [HUB/HSCE0]
reason 02 [PTE] on channel 7 [00ff998000 Renderer[20203]]
Feb 21 14:49:13 cobalt kernel: nouveau 0000:01:00.0:
fifo:000000:0007:[Renderer[20203]] rc scheduled
Feb 21 14:49:13 cobalt kernel: nouveau 0000:01:00.0: fifo:000000: rc
scheduled
Feb 21 14:49:13 cobalt kernel: nouveau 0000:01:00.0:
fifo:000000:0007:0007:[Renderer[20203]] errored - disabling channel
Feb 21 14:49:13 cobalt kernel: nouveau 0000:01:00.0: Renderer[20150]:
channel 7 killed!

in the /var/log/syslog log every time Firefox crashes.I suspect some
other software that uses the GPU exhibits the same.=20
Wayland session, Gnome is v45.

Libraries in use:
Mesa 23.5.5
libdrm 2.4.120
xf86-video-nouveau 1.0.17

Kernel: 6.6.13, x86_64. All compiled from sources.=20

Any ideas what else I can try to fix the issue with the GPU? I'm also
happy to test patches or experiment with other things to resolve this
issue.=20

Many thanks,
Alex
--=20
Tactical Nuclear Kittens
