Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE02634475
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 20:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B338410E445;
	Tue, 22 Nov 2022 19:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50ED10E445
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 19:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YvV2qYmfCARqWRX45HebslGCKHrlfAsFa+cPnV5a2UE=; b=NT2UmIG/ukqTxyvg4OjJNJVR6n
 Lvr7A1v6pJkki/W/YvFLA0dh/WSwxpXu7XkTVv3OHv68NtyX02NbeWNVTotaOuqpV9Kptsc+EufyK
 cdp1JKpbFeH5Rob0Xvh7/qS3DM89/xh4uJEF8NlawNFT30jIU9GwhT5DnuErvnupS4y7WnnmE/Pw4
 sB2RFkMH+jQRFmYFw+I8/xAB0EDTKriHMxa1Qzr4BToI8/uf+t1u86vqwm8AF8RjVu1DHH4Y24g4Y
 lXYhayqPjGZ4rNA3iaVc9xLHp8YJU6kd3WQ1mlq+bEfATYCobHF6a7G1nfSF9ZFyMbewr+mHydP48
 X3NpDeng==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=58456)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oxYqf-0007SH-6t; Tue, 22 Nov 2022 20:22:25 +0100
Message-ID: <02bc2442-e3b3-d720-9d13-ffcdfd760fb8@tronnes.org>
Date: Tue, 22 Nov 2022 20:22:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: git send-email friendly smtp provider anyone?
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
 <20221121151922.jaal6ym7z2ejju4q@houat>
 <de12952f-8346-8995-236d-69dcb70f19f6@tronnes.org>
 <20221122155122.edxtmsqpjxgj4dsj@meerkat.local>
 <3b06dfd5-0eb4-dbfc-6ba8-077b1a92865b@tronnes.org>
 <20221122185001.q6hmeblp64jqdzvz@meerkat.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221122185001.q6hmeblp64jqdzvz@meerkat.local>
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 22.11.2022 19.50, skrev Konstantin Ryabitsev:
> On Tue, Nov 22, 2022 at 06:42:19PM +0100, Noralf Trønnes wrote:
>> The first thing that strikes me is that everyone mentioned in one of the
>> patches get the entire patchset, even stable@vger.kernel.org (cc'ed in a
>> fixes patch). The first patch touches a core file and as a result a few
>> drivers, so I've cc'ed the driver maintainers in that patch, but now
>> they get the entire patchset where 5 of 6 patches is about a driver that
>> I maintain. So from their point of view, they see a patchset about a
>> driver they don't care about and a patch touching a core file, but from
>> the subject it's not apparent that it touches their driver. I'm afraid
>> that this might result in none of them looking at that patch. In this
>> particular case it's not that important, but in another case it might be.
> 
> I did some (unscientific) polling among kernel maintainers and, by a vast
> margin, they always prefer to receive the entire series instead of
> cherry-picked patches -- having the entire series helps provide important
> context for the change they are looking at.
> 
> So, this is deliberate and, for now at least, not configurable. Unless you're
> sending 100+ patch series, I doubt anyone will have any problem with receiving
> the whole series instead of individual patches.
> 
>> As for the setting up the web endpoint, should I just follow the b4 docs
>> on that?
>>
>> I use b4 version 0.10.1, is that recent enough?
> 
> Yes. There will be a 0.10.2 in the near future, but the incoming fixes
> shouldn't make much difference for the b4 send code.
> 

This is what I got:

$ b4 send --web-auth-verify <challenge string from email>
Signing challenge
Submitting verification to https://lkml.kernel.org/_b4_submit
Traceback (most recent call last):
  File "/home/pi/.local/bin/b4", line 8, in <module>
    sys.exit(cmd())
  File "/home/pi/.local/lib/python3.10/site-packages/b4/command.py",
line 341, in cmd
    cmdargs.func(cmdargs)
  File "/home/pi/.local/lib/python3.10/site-packages/b4/command.py",
line 86, in cmd_send
    b4.ez.cmd_send(cmdargs)
  File "/home/pi/.local/lib/python3.10/site-packages/b4/ez.py", line
1102, in cmd_send
    auth_verify(cmdargs)
  File "/home/pi/.local/lib/python3.10/site-packages/b4/ez.py", line
188, in auth_verify
    res = ses.post(endpoint, json=req)
  File "/usr/lib/python3/dist-packages/requests/sessions.py", line 590,
in post
    return self.request('POST', url, data=data, json=json, **kwargs)
  File "/usr/lib/python3/dist-packages/requests/sessions.py", line 528,
in request
    prep = self.prepare_request(req)
  File "/usr/lib/python3/dist-packages/requests/sessions.py", line 456,
in prepare_request
    p.prepare(
  File "/usr/lib/python3/dist-packages/requests/models.py", line 319, in
prepare
    self.prepare_body(data, files, json)
  File "/usr/lib/python3/dist-packages/requests/models.py", line 469, in
prepare_body
    body = complexjson.dumps(json)
  File "/usr/lib/python3.10/json/__init__.py", line 231, in dumps
    return _default_encoder.encode(obj)
  File "/usr/lib/python3.10/json/encoder.py", line 199, in encode
    chunks = self.iterencode(o, _one_shot=True)
  File "/usr/lib/python3.10/json/encoder.py", line 257, in iterencode
    return _iterencode(o, 0)
  File "/usr/lib/python3.10/json/encoder.py", line 179, in default
    raise TypeError(f'Object of type {o.__class__.__name__} '
TypeError: Object of type bytes is not JSON serializable

$ python3 --version
Python 3.10.6

Turning on debug output didn't add much:

$ b4 -d send --web-auth-verify 7ad470b4-f531-4632-8093-738d4d3e5d88
Running git --no-pager rev-parse --show-toplevel
Running git --no-pager config -z --get-regexp b4\..*
Running git --no-pager config -z --get-regexp gpg\..*
Running git --no-pager config -z --get-regexp user\..*
Signing challenge
Submitting verification to https://lkml.kernel.org/_b4_submit
Traceback (most recent call last):
  File "/home/pi/.local/bin/b4", line 8, in <module>
    sys.exit(cmd())
  File "/home/pi/.local/lib/python3.10/site-packages/b4/command.py",
line 341, in cmd
    cmdargs.func(cmdargs)
  File "/home/pi/.local/lib/python3.10/site-packages/b4/command.py",
line 86, in cmd_send
    b4.ez.cmd_send(cmdargs)
  File "/home/pi/.local/lib/python3.10/site-packages/b4/ez.py", line
1102, in cmd_send
    auth_verify(cmdargs)
  File "/home/pi/.local/lib/python3.10/site-packages/b4/ez.py", line
188, in auth_verify
    res = ses.post(endpoint, json=req)
  File "/usr/lib/python3/dist-packages/requests/sessions.py", line 590,
in post
    return self.request('POST', url, data=data, json=json, **kwargs)
  File "/usr/lib/python3/dist-packages/requests/sessions.py", line 528,
in request
    prep = self.prepare_request(req)
  File "/usr/lib/python3/dist-packages/requests/sessions.py", line 456,
in prepare_request
    p.prepare(
  File "/usr/lib/python3/dist-packages/requests/models.py", line 319, in
prepare
    self.prepare_body(data, files, json)
  File "/usr/lib/python3/dist-packages/requests/models.py", line 469, in
prepare_body
    body = complexjson.dumps(json)
  File "/usr/lib/python3.10/json/__init__.py", line 231, in dumps
    return _default_encoder.encode(obj)
  File "/usr/lib/python3.10/json/encoder.py", line 199, in encode
    chunks = self.iterencode(o, _one_shot=True)
  File "/usr/lib/python3.10/json/encoder.py", line 257, in iterencode
    return _iterencode(o, 0)
  File "/usr/lib/python3.10/json/encoder.py", line 179, in default
    raise TypeError(f'Object of type {o.__class__.__name__} '
TypeError: Object of type bytes is not JSON serializable


Noralf.
