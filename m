Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7593A116961
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4556E33A;
	Mon,  9 Dec 2019 09:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BAC6E338
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 09:34:30 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j42so15308267wrj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 01:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=chHlKanqU7Uyyw79vXuYpOlAkhHRJ7024pEW0a6Dr6c=;
 b=UxtjqxAKm9tIUbKDd2bYZPRRNFhZoukhWXdU4zC63YZ+oYsImgyk6v83S4oYlzHTF0
 QDatmNijsc40476mL2asdzufrBRw54w4s2g4raP9oPlhKmV4Aim976EKjg8R21TcYOGc
 ldv4f+tEGtz0GZNOMr8qS+O98aHIX7JnFOCj7IrlBbTinii97SRc9MsOw38UCL0DEz9F
 1o1UdnEZw81WanB8dC/FXdzy/pU+yu5hJv/6UC3VieLYWQnAPijbqlROcGirVTM3VE1e
 P4Y1fJJoULKQs/G0I+EG1aPIOOjTXz//pseeIG0XKL8koAkpM3c7Hot1tUONU2V9zbmI
 NeNA==
X-Gm-Message-State: APjAAAU6osCCwBW56FqqJpKTQCwf3L7CxTgzHHWqjhbnRLTI28NlGfSq
 0Hsry8YyLA7XWnIQtu8byHo7Mg==
X-Google-Smtp-Source: APXvYqxeXVtfZmtZ3DvmEyDwewtz6GWi1pXJycVPvbbnv6UpUlbfAiASqYKgwYJINjjLSIh0E8iIaw==
X-Received: by 2002:adf:eb09:: with SMTP id s9mr1017033wrn.61.1575884068578;
 Mon, 09 Dec 2019 01:34:28 -0800 (PST)
Received: from [10.101.1.4]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id l17sm13085412wme.45.2019.12.09.01.34.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Dec 2019 01:34:28 -0800 (PST)
Subject: Re: [PATCH v2 0/2] Meson VPU: fix CVBS output
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
References: <20191208171832.1064772-1-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 mQENBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAG0KE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT6JATsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIW5AQ0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAYkBHwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8guQINBFYnf6QBEADQ+wBYa+X2n/xIQz/RUoGHf84Jm+yTqRT43t7sO48/cBW9vAn9
 GNwnJ3HRJWKATW0ZXrCr40ES/JqM1fUTfiFDB3VMdWpEfwOAT1zXS+0rX8yljgsWR1UvqyEP
 3xN0M/40Zk+rdmZKaZS8VQaXbveaiWMEmY7sBV3QvgOzB7UF2It1HwoCon5Y+PvyE3CguhBd
 9iq5iEampkMIkbA3FFCpQFI5Ai3BywkLzbA3ZtnMXR8Qt9gFZtyXvFQrB+/6hDzEPnBGZOOx
 zkd/iIX59SxBuS38LMlhPPycbFNmtauOC0DNpXCv9ACgC9tFw3exER/xQgSpDVc4vrL2Cacr
 wmQp1k9E0W+9pk/l8S1jcHx03hgCxPtQLOIyEu9iIJb27TjcXNjiInd7Uea195NldIrndD+x
 58/yU3X70qVY+eWbqzpdlwF1KRm6uV0ZOQhEhbi0FfKKgsYFgBIBchGqSOBsCbL35f9hK/JC
 6LnGDtSHeJs+jd9/qJj4WqF3x8i0sncQ/gszSajdhnWrxraG3b7/9ldMLpKo/OoihfLaCxtv
 xYmtw8TGhlMaiOxjDrohmY1z7f3rf6njskoIXUO0nabun1nPAiV1dpjleg60s3OmVQeEpr3a
 K7gR1ljkemJzM9NUoRROPaT7nMlNYQL+IwuthJd6XQqwzp1jRTGG26J97wARAQABiQM+BBgB
 AgAJBQJWJ3+kAhsCAikJEBaat7Gkz/iuwV0gBBkBAgAGBQJWJ3+kAAoJEHfc29rIyEnRk6MQ
 AJDo0nxsadLpYB26FALZsWlN74rnFXth5dQVQ7SkipmyFWZhFL8fQ9OiIoxWhM6rSg9+C1w+
 n45eByMg2b8H3mmQmyWztdI95OxSREKwbaXVapCcZnv52JRjlc3DoiiHqTZML5x1Z7lQ1T3F
 8o9sKrbFO1WQw1+Nc91+MU0MGN0jtfZ0Tvn/ouEZrSXCE4K3oDGtj3AdC764yZVq6CPigCgs
 6Ex80k6QlzCdVP3RKsnPO2xQXXPgyJPJlpD8bHHHW7OLfoR9DaBNympfcbQJeekQrTvyoASw
 EOTPKE6CVWrcQIztUp0WFTdRGgMK0cZB3Xfe6sOp24PQTHAKGtjTHNP/THomkH24Fum9K3iM
 /4Wh4V2eqGEgpdeSp5K+LdaNyNgaqzMOtt4HYk86LYLSHfFXywdlbGrY9+TqiJ+ZVW4trmui
 NIJCOku8SYansq34QzYM0x3UFRwff+45zNBEVzctSnremg1mVgrzOfXU8rt+4N1b2MxorPF8
 619aCwVP7U16qNSBaqiAJr4e5SNEnoAq18+1Gp8QsFG0ARY8xp+qaKBByWES7lRi3QbqAKZf
 yOHS6gmYo9gBmuAhc65/VtHMJtxwjpUeN4Bcs9HUpDMDVHdfeRa73wM+wY5potfQ5zkSp0Jp
 bxnv/cRBH6+c43stTffprd//4Hgz+nJcCgZKtCYIAPkUxABC85ID2CidzbraErVACmRoizhT
 KR2OiqSLW2x4xdmSiFNcIWkWJB6Qdri0Fzs2dHe8etD1HYaht1ZhZ810s7QOL7JwypO8dscN
 KTEkyoTGn6cWj0CX+PeP4xp8AR8ot4d0BhtUY34UPzjE1/xyrQFAdnLd0PP4wXxdIUuRs0+n
 WLY9Aou/vC1LAdlaGsoTVzJ2gX4fkKQIWhX0WVk41BSFeDKQ3RQ2pnuzwedLO94Bf6X0G48O
 VsbXrP9BZ6snXyHfebPnno/te5XRqZTL9aJOytB/1iUna+1MAwBxGFPvqeEUUyT+gx1l3Acl
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <0a1036eb-a64e-b14a-a881-29ff49368eff@baylibre.com>
Date: Mon, 9 Dec 2019 10:34:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191208171832.1064772-1-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=chHlKanqU7Uyyw79vXuYpOlAkhHRJ7024pEW0a6Dr6c=;
 b=lU4/Tx74KrkZlJSRoBAn1gNHkuh3QWPTcVX1U3gm/U2Th2z6O5/zHdFES6Svq2zP5k
 KOYYRMAJUXWbZlt7W++7+G3OunQ1c4Dqiivbo9TyL7XjFW+psM2M3JtwrIBTqV8JHPhs
 Jzrum6NowIbx1hM1/4/D7PdYxeh+Y0sPmYRPfw4XFBFvc0h+XEkMB3/NXt6tE1AI8ipd
 3WjVFpn78V118QeIz7KwSvQvXKAS890n0EP00/IUYB4xkPqGi848p/WESCTnXDGi8G/K
 6Wy+DYGc3BXK+kn54j1EcnJewZHr18ZygZSpyNK+M8omMD2In6TWgUvqpihZFlIqluUF
 6GvQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: airlied@linux.ie, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDgvMTIvMjAxOSAxODoxOCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBUaGUgZ29h
bCBvZiB0aGlzIHNlcmllcyBpcyB0byBmaXggdGhlIENWQlMgb3V0cHV0IHdpdGggdGhlIE1lc29u
IFZQVQo+IGRyaXZlci4gUHJpb3IgdG8gdGhpcyBzZXJpZXMga21zY3ViZSByZXBvcnRlZDoKPiAg
IGZhaWxlZCB0byBzZXQgbW9kZTogSW52YWxpZCBhcmd1bWVudAo+IAo+IENoYW5nZXMgc2luY2Ug
djEgYXQgWzBdOgo+IC0gYWRkIHBhdGNoIHRvIHJlbW92ZSBkdXBsaWNhdGUgY29kZSAodG8gbWF0
Y2ggcGF0Y2ggIzIgZWFzaWVyKQo+IC0gdXNlIGRybV9tb2RlX21hdGNoIHdpdGhvdXQgRFJNX01P
REVfTUFUQ0hfQVNQRUNUX1JBVElPIGFzIHN1Z2dlc3RlZAo+ICAgYnkgTmVpbAo+IAo+IAo+IFsw
XSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMjY4MTYxLwo+IAo+IAo+IE1h
cnRpbiBCbHVtZW5zdGluZ2wgKDIpOgo+ICAgZHJtOiBtZXNvbjogdmVuYzogY3ZiczogZGVkdXBs
aWNhdGUgdGhlIG1lc29uX2N2YnNfbW9kZSBsb29rdXAgY29kZQo+ICAgZHJtOiBtZXNvbjogdmVu
YzogY3ZiczogZml4IENWQlMgbW9kZSBtYXRjaGluZwo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fdmVuY19jdmJzLmMgfCA0OCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKPiAKCkFwcGxp
ZWQgdG8gZHJtLW1pc2MtZml4ZXMKClRoYW5rcyAhCgpOZWlsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
