Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AFEA44F19
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 22:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD8410E7F8;
	Tue, 25 Feb 2025 21:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.b="U9LzR57r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A944A10E7F7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 21:43:32 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-38f5fc33602so162477f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.com; s=google; t=1740519811; x=1741124611; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:subject:references:cc:to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=v6VBRIDfPPAuGSOJ6DX9lU3J+goTuMImOESXIUQcXCg=;
 b=U9LzR57rLi5Olg82DaGGWmm4JK1z5QHHDSOSl+dLaQKJCivVdXowZ7NhsxPJJ03jCA
 OVLKMkynxlhXKMUro2BI9nvsjJsN6M4FxrfB+b/+SQaaooZ9rkgQVbhhovJRjbMsgJYF
 8sLVWgzAekmDJNcB7SiFpWTki0TCz/75uUOt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740519811; x=1741124611;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:subject:references:cc:to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6VBRIDfPPAuGSOJ6DX9lU3J+goTuMImOESXIUQcXCg=;
 b=wkl0UHUgpjL6erR3WsTTTNukxVvXsTeZivuxggkP3rdc5iah5GcsFDj2+i8JlDHl7S
 robT7DSC6W6WzRb/QLGAg14/BI3mSaR5QLhhhFakaPGZ1Tk8H23YHM6dp8Uo02c0nWRa
 m8Fenc5+YL7eVKUxyhqaS32a8GzredBxcVKhQR2J+Zc9YhC7wTlgMfX+nlVkA842l+I3
 OfdxAZPR+Yl7pe0GCX1q/L2OggXHA/ZZAZAhDX2o5oJNGOREWb8bdn3BpsK7cMqUgDZO
 qq/T7cG/1ZPMMYxiivZ8qU2+YdjhvbRSQmjC2sVmxtYONNNoVphuMeZ81KWUPgjsN8LZ
 oGzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2VGKAWi3A29lD5yHLJJBX49Ue9k7TTavQWIXeYl1zRGrtgcEtszP3G3UOxyxbw//BeSZkTKeJPyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcudHkqkNRXj2FebRuJGoOEU50ECHc5GjP+fTejwgmaP8lDFT/
 CVMqeIQMO3RiPad69XKVkWt5Pnb6u69+3Y9/oTO0ZSLNq5Xcvu32Gc8JuxQo7QA=
X-Gm-Gg: ASbGnctwQPHfZlnKenbJeFCNKZDHqwye9CjHP3upTI8LgsLuWq8WacGn4ZeAresEfI1
 m+bbyG7bSBelCSCADQZEirASmopIND5ORVt0T49z41kcyFL25CQHxiwesRyuuT6SXEEnZNcOoKF
 MpOoOWuWa3nOp+LXVSRwDqL7Sy9u1LCK1LmYQieeAk91GXUunQ9XC14mJRjWaCRsp8kAUVNj3vP
 RFq6NbNXIhbaaCmN8kkAqyY19s7f8stcmDHz2XdzNU5JrcPoHuLQ1xU8qJvzW05IPBraQmumZl3
 IyUPW4r7I+HP9J/SFvvY+pI4OIgoNzDSQ6lUazh5ruYFJu5E3f+9KARK21IaGUppew==
X-Google-Smtp-Source: AGHT+IHSlhsBYfXGudlA126ARnimf5DJid2NXAt0zMRZRmjxnTP+DlMFj1fR7Dt14yukNzUQAYX1Dg==
X-Received: by 2002:a5d:64a7:0:b0:38b:f4e6:21aa with SMTP id
 ffacd0b85a97d-38f6f3c50b0mr11926957f8f.5.1740519810679; 
 Tue, 25 Feb 2025 13:43:30 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8fcf29sm3520900f8f.100.2025.02.25.13.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 13:43:30 -0800 (PST)
Message-ID: <8052b316-9f72-42c7-9e11-e23e690d80c4@citrix.com>
Date: Tue, 25 Feb 2025 21:43:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: hpa@zytor.com
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 akpm@linux-foundation.org, alistair@popple.id.au, andrew+netdev@lunn.ch,
 andrzej.hajda@intel.com, arend.vanspriel@broadcom.com,
 awalls@md.metrocast.net, bp@alien8.de, bpf@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 dave.hansen@linux.intel.com, davem@davemloft.net,
 david.laight.linux@gmail.com, dmitry.torokhov@gmail.com,
 dri-devel@lists.freedesktop.org, eajames@linux.ibm.com, edumazet@google.com,
 eleanor15x@gmail.com, gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
 jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
 jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux@rasmusvillemoes.dk, louis.peens@corigine.com,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mingo@redhat.com,
 miquel.raynal@bootlin.com, mripard@kernel.org, neil.armstrong@linaro.org,
 netdev@vger.kernel.org, oss-drivers@corigine.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, rfoss@kernel.org, richard@nod.at,
 simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de, vigneshr@ti.com,
 visitorckw@gmail.com, x86@kernel.org, yury.norov@gmail.com
References: <3BC57C78-1DFF-4B83-85AA-A908DBF2B958@zytor.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <3BC57C78-1DFF-4B83-85AA-A908DBF2B958@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

> Incidentally, in all of this, didn't anyone notice __builtin_parity()?

Yes.  It it has done sane for a decade on x86, yet does things such as
emitting a library call on other architectures.

https://godbolt.org/z/6qG3noebq

~Andrew
