Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A70A4FBE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 09:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36B189BFC;
	Mon,  2 Sep 2019 07:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121CE6E0F3
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 17:07:40 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id u6so5709528edq.6
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 10:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lik2TQFtm24ZeMK7lbOS3RM+iMDhKtG/DlU1Hn/vZvk=;
 b=PHqooa2qAbSFDQYAGsCt4XwA3JeDKXhDQEQz29K0M5xBXTXxTDYiQ9IuMQQx7d1jcu
 013qSv5lv7anAgC2G0jTyVtfnNFDDHPnLDPguMlvBcFwP1vsIrrSqO5jvhBUlHKihypG
 NDuZuNfxhPWo6+XrMUs2A1pgvx/bMbhotutJxjDtYdxTFR/hf8nLjL4HTRLZGhK7Z6eu
 cW1qQ5Kkdnyx8yXNHePwvSjMMKPQRU3lJdF1hNBwF1lcWTI7hwgomrmuKS9gspyTBofD
 CtuT19eQOrgTD04fT5E3X/T7htCLdJZP7Pvv3jrKhW4k/QkDYaJqtV6q6gZfGJuBg0dU
 WLeg==
X-Gm-Message-State: APjAAAWjTfhzv0ZhUlv4cWhxekxH5fwPD254r4e1GFC7kmmxgBEqrhy3
 Ae8Mst2wXLuFR6aLTYjSHkao38+W0oU=
X-Google-Smtp-Source: APXvYqwYiVn+T/jnXqHdTksQFpnl6eq02sfkOXYISHWm5GobK2D0xg22AxYic/zL89Sp0zVPu8fsxw==
X-Received: by 2002:a50:88c5:: with SMTP id d63mr21674654edd.122.1567271258673; 
 Sat, 31 Aug 2019 10:07:38 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru.
 [188.32.48.208])
 by smtp.gmail.com with ESMTPSA id i23sm1739594edv.11.2019.08.31.10.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Aug 2019 10:07:38 -0700 (PDT)
Subject: Re: [PATCH v3 01/11] checkpatch: check for nested (un)?likely() calls
To: Markus Elfring <Markus.Elfring@web.de>, Joe Perches <joe@perches.com>
References: <20190829165025.15750-1-efremov@linux.com>
 <0d9345ed-f16a-de0b-6125-1f663765eb46@web.de>
 <689c8baf-2298-f086-3461-5cd1cdd191c6@linux.com>
 <493a7377-2de9-1d44-cd8f-c658793d15db@web.de>
From: Denis Efremov <efremov@linux.com>
Message-ID: <c5e4479d-2fb3-b5a5-00c3-b06e5177d869@linux.com>
Date: Sat, 31 Aug 2019 20:07:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <493a7377-2de9-1d44-cd8f-c658793d15db@web.de>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 02 Sep 2019 07:24:25 +0000
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
Cc: dri-devel@lists.freedesktop.org, Leon Romanovsky <leon@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-rdma@vger.kernel.org,
 Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>,
 Saeed Mahameed <saeedm@mellanox.com>, linux-input@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Pismenny <borisp@mellanox.com>,
 linux-arm-msm@vger.kernel.org, linux-wimax@intel.com,
 Enrico Weigelt <lkml@metux.net>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Whitcroft <apw@canonical.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Sean Paul <sean@poorly.run>,
 Anton Altaparmakov <anton@tuxera.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAzMS4wOC4yMDE5IDE5OjQ1LCBNYXJrdXMgRWxmcmluZyB3cm90ZToKPj4+PiArIyBuZXN0
ZWQgbGlrZWx5L3VubGlrZWx5IGNhbGxzCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICgkbGluZSA9
fiAvXGIoPzooPzp1bik/bGlrZWx5KVxzKlwoXHMqIT9ccyooSVNfRVJSKD86X09SX05VTEx8X1ZB
TFVFKT98V0FSTikvKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgV0FSTigiTElLRUxZ
X01JU1VTRSIsCj4+Pgo+Pj4gSG93IGRvIHlvdSB0aGluayBhYm91dCB0byB1c2UgdGhlIHNwZWNp
ZmljYXRpb24g4oCcKD86SVNfRVJSKD86Xyg/Ok9SX05VTEx8VkFMVUUpKT98V0FSTinigJ0KPj4+
IGluIHRoaXMgcmVndWxhciBleHByZXNzaW9uPwo+IOKApgo+PiAgICBJU19FUlIKPj4gICAgKD86
XyA8LSBBbm90aGVyIGF0b21pYyBncm91cCBqdXN0IHRvIHNob3cgdGhhdCAnXycgaXMgYSBjb21t
b24gcHJlZml4Pwo+IAo+IFllcy4gLSBJIGhvcGUgdGhhdCB0aGlzIHNwZWNpZmljYXRpb24gZGV0
YWlsIGNhbiBoZWxwIGEgYml0LgoKSSdtIG5vdCBzdXJlIHRoYXQgYW5vdGhlciBwYWlyIG9mIGJy
YWNrZXRzIGZvciBhIHNpbmdsZSBjaGFyIHdvcnRoIGl0LgoKPj4gICAgICAgICAgICBVc3VhbGx5
LCBQZXJsIGludGVycHJldGVyIGlzIHZlcnkgZ29vZCBhdCBvcHRpbWl6aW5nIHN1Y2ggdGhpbmdz
LgoKVGhlIGludGVycHJldGVyIG9wdGltaXplcyBpdCBpbnRlcm5hbGx5OgplY2hvICdJU19FUlJf
T1JfTlVMTCcgfCBwZXJsIC1NcmU9ZGVidWcgLW5lICcvSVNfRVJSKD86X09SX05VTEx8X1ZBTFVF
KT8vICYmIHByaW50JwpDb21waWxpbmcgUkV4ICJJU19FUlIoPzpfT1JfTlVMTHxfVkFMVUUpPyIK
RmluYWwgcHJvZ3JhbToKICAgMTogRVhBQ1QgPElTX0VSUj4gKDQpCiAgIDQ6IENVUkxZWFswXXsw
LDF9ICgxNikKICAgNjogICBFWEFDVCA8Xz4gKDgpICAgICAgPC0tIGNvbW1vbiBwcmVmaXgKICAg
ODogICBUUklFLUVYQUNUW09WXSAoMTUpCiAgICAgICAgPE9SX05VTEw+IAogICAgICAgIDxWQUxV
RT4KLi4uCj4gCj4gV291bGQgeW91IGxpa2UgdG8gaGVscCB0aGlzIHNvZnR3YXJlIGNvbXBvbmVu
dCBieSBvbWl0dGluZyBhIHBhaXIgb2YKPiBub24tY2FwdHVyaW5nIHBhcmVudGhlc2VzIGF0IHRo
ZSBiZWdpbm5pbmc/Cj4gCj4gXGIoPzp1bik/bGlrZWx5XHMqCgpUaGlzIHBhaXIgb2YgYnJhY2tl
dHMgaXMgcmVxdWlyZWQgdG8gbWF0Y2ggInVubGlrZWx5IiBhbmQgaXQncwpvcHRpb25hbCBpbiBv
cmRlciB0byBtYXRjaCAibGlrZWx5Ii4KClJlZ2FyZHMsCkRlbmlzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
