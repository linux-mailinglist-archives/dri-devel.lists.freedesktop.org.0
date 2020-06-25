Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD193209A8C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 09:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD086E87F;
	Thu, 25 Jun 2020 07:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7846E8AB
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 00:47:57 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id t25so36542lji.12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 17:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cEe6tz7Y8y564FV1ImrFoRZs0TUgSgWk1EJfVpk6/Tw=;
 b=KJKdS6nIbLsi/NZMdl+edwkpR/AEMjMrDISA570AJHe+L3ZopniZhiYwFiC/miTSG0
 L+wb2bjzTsoYwH6uwFcfWHjG6NwhUYO7mTFSJowH9iEsPWA6BZLcbkZoj4oCj3uQTkgj
 at2pPwu/SPvO5AT/+3mLgTv4wjeTpTIHSAy03XVgV42IpqDqArph/wW5BOOwh8sctCWT
 2tcsVsh21Qi9AblpEN6N0I18UXoDDbrKFGl78Q4J3vfDSkMCI2mC4KJ1xWIV+Zw+yTv4
 AezoHBxON+ATxTl1T62ncVjxqZCZZ7ALR6XTID5muUyXzW86jysEv3Bw+GO+z+UC0YtJ
 pzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cEe6tz7Y8y564FV1ImrFoRZs0TUgSgWk1EJfVpk6/Tw=;
 b=hV9QybxT7WgYEs+whU6TQM+e3DGVZC3qNEj5UDTLWqhHo/U7S/aBxYwU1LohhOJYPr
 hzIk449YwOrW7MJBtwYDPX3klw4jdv4AiVdfwikYSbnCHgHLEgk+6W/EQl4TwQp0w4rc
 LhwzHCrVPRK+wcP7CWHfqzXRJ75dwAUp3Z4ecPKl1HS/tZhyEqu19L0jd3/aOchwkLyA
 xZxyitgq+wS5fj5Z8WrbjELRU9n3a/rKVpBuj7y74VOZSCZ5ND4qZoYwn0WLGr0qru7d
 54C+ihgkcj1bGis4av1PwVoyzX2CMkJZtUnzFDXvPrHnAL5bhnbY/P/7JAvPOgsgjBri
 Y3Xg==
X-Gm-Message-State: AOAM530m0JatNPySBa4gy9DH5eG1o3ITqlWc7AprLhriNQ6fUsWwE/91
 SJqJK17WP13z+h56o/96hKo=
X-Google-Smtp-Source: ABdhPJyz6q75BxU6kcQO5oV91VyFLqQNwvHbAYwjswzIMHVYc4yvNgqD1rrDZvzUfbh9LOYy8pqfeg==
X-Received: by 2002:a2e:2f1e:: with SMTP id v30mr4268405ljv.202.1593046075984; 
 Wed, 24 Jun 2020 17:47:55 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id v22sm4515152ljg.12.2020.06.24.17.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2020 17:47:55 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <10f9a8e5-9972-76bc-f60a-1bf1211e55e1@gmail.com>
Date: Thu, 25 Jun 2020 03:47:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 25 Jun 2020 07:31:01 +0000
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDYuMjAyMCAxNTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gI2RlZmluZSBE
Uk1fVEVHUkFfU1VCTUlUX0NSRUFURV9QT1NUX1NZTkNfRklMRcKgwqDCoMKgwqAgKDE8PDApCj4g
I2RlZmluZSBEUk1fVEVHUkFfU1VCTUlUX0NSRUFURV9QT1NUX1NZTkNPQkrCoMKgwqDCoMKgwqDC
oCAoMTw8MSkKClRoZSBzeW5jIG9iamVjdCBzaG91bGRuJ3QgYmUgY3JlYXRlZCBieSB0aGUga2Vy
bmVsIGRyaXZlciBhbmQgd2UKc2hvdWxkbid0IG5lZWQgdGhlIHN5bmMtZmlsZSBGRC4KClBsZWFz
ZSBjb25zaWRlciB0aGlzIGV4YW1wbGUgb2YgaG93IHN5bmNvYmogbWF5IGJlIHVzZWQ6CgogIDEu
IFN5bmNvYmogaXMgY3JlYXRlZCBieSB1c2Vyc3BhY2UuCgogIDIuIFN5bmNvYmoncyBoYW5kbGUg
KHBvc3RfZmVuY2UpIGlzIHBhc3NlZCB3aXRoIHRoZSBqb2IgdG8gdGhlIGtlcm5lbApkcml2ZXIu
CgogIDMuIFVzZXJzcGFjZSB3YWl0cyBvbiBzeW5jb2JqIGZvciB0aGUgam9iJ3Mgc3VibWlzc2lv
bi4KCiAgNC4gS2VybmVsIGRyaXZlciBhdHRhY2hlcyBqb2ItY29tcGxldGlvbiBkbWEtZmVuY2Uo
cykgdG8gdGhlIHN5bmNvYmoKYWZ0ZXIgc3RhcnRpbmcgdG8gZXhlY3V0ZSB0aGUgam9iLgoKICA1
LiBVc2Vyc3BhY2Ugd2FpdHMgb24gc3luY29iaiBmb3IgdGhlIGpvYidzIGNvbXBsZXRpb24uCgpT
eW5jb2JqIGlzIGEgc3VwZXJzZXQgb2YgdGhlIHN5bmMtZmlsZSBmZW5jZToKCiAgYSkgU3luY29i
aiBkb2Vzbid0IGhhdmUgYSBiYWNraW5nIGZpbGUgZGVzY3JpcHRvciB3aGVuIGl0J3MgY3JlYXRl
ZC4KRm9yIGV4YW1wbGUsIHdoeSB3b3VsZCB5b3UgbmVlZCBhbiBGRCBpZiB5b3UncmUgbm90IGdv
aW5nIHRvIHNoYXJlIGZlbmNlCndpdGggb3RoZXIgcHJvY2Vzc2VzLiBJdCdzIHBvc3NpYmxlIHRv
IGdldCBGRCBvdXQgb2Ygc3luY29iaiBsYXRlciBvbiwKcGxlYXNlIHNlZSBbMV1bMl0uCgogIGIp
IFN5bmNvYmogaXMgZGVzaWduZWQgdG8gYmUgdXNlZCB3aXRoIGEgR1BVIGpvYnMuIEZvciBleGFt
cGxlLAp1c2Vyc3BhY2UgcGFzc2VzIGpvYiB0byB0aGUgR1BVIGRyaXZlcidzIHNjaGVkdWxlciBh
bmQgdGhlbiB3YWl0cyB1bnRpbApqb2IgaGFzIGJlZW4gc3RhcnRlZCB0byBleGVjdXRlIG9uIGhh
cmR3YXJlLCB0aGlzIGlzIGFscmVhZHkgc3VwcG9ydGVkCmJ5IHN5bmNvYmouCgogIGMpIEl0IGlz
IHBvc3NpYmxlIHRvIGF0dGFjaCBzeW5jLWZpbGUncyBmZW5jZSB0byBhIHN5bmNvYmogWzFdWzJd
WzNdCmFuZCBub3c6CgogIC0gVXNlcnNwYWNlIG1heSBhdHRhY2ggc3luYy1maWxlJ3MgZmVuY2Ug
dG8gYSBzeW5jb2JqLgoKICAtIFVzZXJzcGFjZSBtYXkgdXNlIHRoaXMgc3luY29iaiBmb3IgdGhl
IGpvYidzIHByZS1mZW5jZS4KCiAgLSBLZXJuZWwgZHJpdmVyIHdpbGwgdGFrZSBvdXQgdGhlIHBy
ZS1mZW5jZSBmcm9tIHRoZSBzeW5jb2JqIGR1cmluZyBvZgp0aGUgam9iJ3Mgc3VibWlzc2lvbiBh
bmQgcmVzZXQgdGhlIHN5bmNvYmoncyBmZW5jZSB0byBOVUxMLgoKICAtIEpvYidzIHNjaGVkdWxl
ciB3aWxsIHdhaXQgb24gdGhpcyBwcmUtZmVuY2UgYmVmb3JlIHN0YXJ0aW5nIHRvCmV4ZWN1dGUg
am9iLgoKICAtIE9uY2UgdGhlIGpvYiBpcyBzdGFydGVkIHRvIGV4ZWN1dGUsIHRoZSBqb2IncyBz
Y2hlZHVsZXIgd2lsbCBhdHRhY2gKdGhlIGpvYidzIGNvbXBsZXRpb24tZmVuY2UgdG8gdGhlIHN5
bmNvYmouIE5vdyBzeW5jb2JqIGhhcyBhIHBvc3QtZmVuY2UhCgogIGQpIEl0IGlzIHBvc3NpYmxl
IHRvIGdldCBzeW5jLWZpbGUgRkQgb3V0IG9mIHN5bmNvYmogWzFdWzJdWzRdLgoKWzFdCmh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjcuMi9zb3VyY2UvaW5jbHVkZS91YXBpL2Ry
bS9kcm0uaCNMNzMwClsyXQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS43LjIv
c291cmNlL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgjTDkzMwpbM10KaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjUuNy4yL3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmou
YyNMNjUzCls0XQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS43LjIvc291cmNl
L2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jI0w2NzQKCj09PQoKU28sIHN5bmMgb2JqZWN0
IGNhbiBjYXJyeSBib3RoIHByZS1mZW5jZSBhbmQgcG9zdC1mZW5jZSwgYW5kIHRoZXkgY291bGQK
YmUgc3luYy1maWxlIEZEcyEKClRoZSBjb3JvbGxhcnkgaXMgdGhhdCB3ZSBjYW4gZ2V0IGF3YXkg
YnkgdXNpbmcgYSBzaW5nbGUgc3luY29iaiBoYW5kbGUKZm9yIHRoZSBqb2IncyBzdWJtaXNzaW9u
IElPQ1RMLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
