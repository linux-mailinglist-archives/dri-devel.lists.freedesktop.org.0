Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F47BC8B93
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 16:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C5F6E07B;
	Wed,  2 Oct 2019 14:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EE06E07B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 14:44:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 7so7534545wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 07:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LKzMTTB8XV2AJkzo5S/56DrG6y6U1OC2/G5Z8Cw0zJE=;
 b=gUegtmddZjgMlrwNoSX4c6yZ3cpU5/6QcY0GgpsBhWCsTFEGEEpySGHTpUehkf4slg
 +WnieuS27DjBj/5/NVsRSI6VS4oyNvV87v4PhjffLLL9aRKuLrMATv/Wb09RogUcJJGt
 nG6wpj9PAakTcjy9RcFrHF//KOIq+CBy1EsFh9ECmWj3YFqUWiRb72iU9H4sPCLH0Qma
 PE+izsJ2MkYsS61RhDVa/owleVhIQ+hHfWPwPdSlA2LQhCkkUH+t18LjalkIDtLvrMPa
 b2Jf32WvhADQMphbq91BH+Zr6vsjF0OEmoADOSkeRtIEy1PMZF5lnx2GYxffAl0DZr67
 2pUQ==
X-Gm-Message-State: APjAAAUEpPb7A4jrkqfBEWf7RJkMWGJ5MyINwQwwwCVnvvtNqvplB8gK
 uQtPucNZU0AjhZvOq/UBqBuZjg==
X-Google-Smtp-Source: APXvYqw5vtCHPqtCkgw9ZdxQdx3eNIPI89zqupQVrUgJSgf01qmh1DfG369DRIKsrte1anj4Ed6h5Q==
X-Received: by 2002:a7b:c258:: with SMTP id b24mr3132435wmj.21.1570027473707; 
 Wed, 02 Oct 2019 07:44:33 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h17sm11313874wme.6.2019.10.02.07.44.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Oct 2019 07:44:32 -0700 (PDT)
Subject: Re: drm_sched with panfrost crash on T820
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 Hillf Danton <hdanton@sina.com>
References: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
 <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
 <20190930145228.14000-1-hdanton@sina.com>
 <d2888614-8644-7d04-b73b-3ab7c6623e9a@amd.com>
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
Message-ID: <81694dcc-0bb5-0c47-dab2-ed61a65a5845@baylibre.com>
Date: Wed, 2 Oct 2019 16:44:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d2888614-8644-7d04-b73b-3ab7c6623e9a@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LKzMTTB8XV2AJkzo5S/56DrG6y6U1OC2/G5Z8Cw0zJE=;
 b=N5wcQz6tmc0QNH2OOHLHL1cfArP/bC7kbYrThjsiadXH3X4OjM8HrimpMIh0iNpxM9
 SVM7vpkt1agIkPjijOFf9O1qBIaT9IykydKmfy3OzE8LFpjorWWC3fzu/AoHNkUTsjB8
 vvX7LKpJrFH0/4kHC8arM7S99H/IFF2IegBPb1jsRZPWk8z5p0ZJAj6G+9l8eXPdKwWr
 92k8sgElo21Y48o4pG6T7uyrjN77rnTFe1uigBAria5xOT3NEsfYufy8KFAM9hXy235K
 uauIVQKo+KdheuHYY9w/aUGWOhRm4co/ngPyhJUjLZAu1mTCmvoiVjRCwELzbsymiKnK
 lftQ==
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcmV5LAoKCk9uIDAyLzEwLzIwMTkgMTY6NDAsIEdyb2R6b3Zza3ksIEFuZHJleSB3cm90
ZToKPiAKPiBPbiA5LzMwLzE5IDEwOjUyIEFNLCBIaWxsZiBEYW50b24gd3JvdGU6Cj4+IE9uIE1v
biwgMzAgU2VwIDIwMTkgMTE6MTc6NDUgKzAyMDAgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+PiBE
aWQgYSBuZXcgcnVuIGZyb20gNS4zOgo+Pj4KPj4+IFsgICAzNS45NzE5NzJdIENhbGwgdHJhY2U6
Cj4+PiBbICAgMzUuOTc0MzkxXSAgZHJtX3NjaGVkX2luY3JlYXNlX2thcm1hKzB4NWMvMHhmMAo+
Pj4gCQkJZmZmZjAwMDAxMDY2N2YzOAlGRkZGMDAwMDEwNjY3Rjk0Cj4+PiAJCQlkcml2ZXJzL2dw
dS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYzozMzUKPj4+Cj4+PiBUaGUgY3Jhc2hpbmcgbGlu
ZSBpcyA6Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoYmFkLT5zX2Zl
bmNlLT5zY2hlZHVsZWQuY29udGV4dCA9PQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGVudGl0eS0+ZmVuY2VfY29udGV4dCkgewo+Pj4KPj4+IERvZXNuJ3Qgc2VlbSBy
ZWxhdGVkIHRvIGd1aWx0eSBqb2IuCj4+IEJhaWwgb3V0IGlmIHNfZmVuY2UgaXMgbm8gbG9uZ2Vy
IGZyZXNoLgo+Pgo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4u
Ywo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+PiBAQCAt
MzMzLDYgKzMzMywxMCBAQCB2b2lkIGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYShzdHJ1Y3QgZHJt
Cj4+ICAgCj4+ICAgCQkJc3Bpbl9sb2NrKCZycS0+bG9jayk7Cj4+ICAgCQkJbGlzdF9mb3JfZWFj
aF9lbnRyeV9zYWZlKGVudGl0eSwgdG1wLCAmcnEtPmVudGl0aWVzLCBsaXN0KSB7Cj4+ICsJCQkJ
aWYgKCFzbXBfbG9hZF9hY3F1aXJlKCZiYWQtPnNfZmVuY2UpKSB7Cj4+ICsJCQkJCXNwaW5fdW5s
b2NrKCZycS0+bG9jayk7Cj4+ICsJCQkJCXJldHVybjsKPj4gKwkJCQl9Cj4+ICAgCQkJCWlmIChi
YWQtPnNfZmVuY2UtPnNjaGVkdWxlZC5jb250ZXh0ID09Cj4+ICAgCQkJCSAgICBlbnRpdHktPmZl
bmNlX2NvbnRleHQpIHsKPj4gICAJCQkJCWlmIChhdG9taWNfcmVhZCgmYmFkLT5rYXJtYSkgPgo+
PiBAQCAtNTQzLDcgKzU0Nyw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX2pvYl9pbml0KTsK
Pj4gICB2b2lkIGRybV9zY2hlZF9qb2JfY2xlYW51cChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9i
KQo+PiAgIHsKPj4gICAJZG1hX2ZlbmNlX3B1dCgmam9iLT5zX2ZlbmNlLT5maW5pc2hlZCk7Cj4+
IC0Jam9iLT5zX2ZlbmNlID0gTlVMTDsKPj4gKwlzbXBfc3RvcmVfcmVsZWFzZSgmam9iLT5zX2Zl
bmNlLCAwKTsKPj4gICB9Cj4+ICAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfam9iX2NsZWFudXAp
Owo+IAo+IAo+IERvZXMgdGhpcyBjaGFuZ2UgaGVscCB0aGUgcHJvYmxlbSA/IE5vdGUgdGhhdCBk
cm1fc2NoZWRfam9iX2NsZWFudXAgaXMgCj4gY2FsbGVkIGZyb20gc2NoZWR1bGVyIHRocmVhZCB3
aGljaCBpcyBzdG9wcGVkIGF0IGFsbCB0aW1lcyB3aGVuIHdvcmtfdGRyIAo+IHRocmVhZCBpcyBy
dW5uaW5nIGFuZCBhbnl3YXkgdGhlICdiYWQnIGpvYiBpcyBzdGlsbCBpbiB0aGUgCj4gcmluZ19t
aXJyb3JfbGlzdCB3aGlsZSBpdCdzIGJlaW5nIGFjY2Vzc2VkIGZyb23CoCAKPiBkcm1fc2NoZWRf
aW5jcmVhc2Vfa2FybWEgc28gSSBkb24ndCB0aGluayBkcm1fc2NoZWRfam9iX2NsZWFudXAgY2Fu
IGJlIAo+IGNhbGxlZCBmb3IgaXQgQkVGT1JFIG9yIHdoaWxlIGRybV9zY2hlZF9pbmNyZWFzZV9r
YXJtYSBpcyBleGVjdXRlZC4KCkknbSBydW5uaW5nIGl0IHJpZ2h0IG5vdywgd2lsbCBwb3N0IHJl
c3VsdHMgd2hlbiBmaW5pc2hlZC4KClRoYW5rcywKTmVpbAoKPiAKPiBBbmRyZXkKPiAKPiAKPj4g
ICAKPj4gLS0KPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
