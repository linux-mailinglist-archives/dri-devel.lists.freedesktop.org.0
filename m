Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C666F1424
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 11:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C811110EC91;
	Fri, 28 Apr 2023 09:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73E110EC91
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 09:27:21 +0000 (UTC)
Date: Fri, 28 Apr 2023 09:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1682674038; x=1682933238;
 bh=U0MZUFxkg3+UOPqNFrbWaEyCbKpVVLhO0H5Klvvg8Vk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=utBBKjpLeGdvhlXQ8nMT/EJhyLiU9rt+EmEJLV31B3K3dkci6kR9dNao+aiIWVXd8
 iSxpBsIQmAKGRWG7ZmiUPv7tTCLGdEQyoXpf7b9B7oAvNRHN67/EuKdNI4ymcIIXFd
 vf0sIvHqN1DoqI8XQQaQYVenikH0bW9k5Evq/SI20s14RW5XmtO7vS1ztPvx08xo+w
 JvN6B//1otHfUoOD1eEbkaUdiL/6ugp2IUjKmC6FQVvn3aQyMuqMAzekphD6yCPkYO
 3DcJcQU999JEkjOK2HCbeNn+8ntWyZCihJ0M+75GfcTyLkp7lsTDFXKxpTlfuLH/3g
 qsQWe8eX2KAhw==
To: Ville Syrjala <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/6] drm/uapi: Document CTM matrix better
Message-ID: <YyWZa1bj6suPnBWfIRn-j3ixVrbKoPRc0EVl_QWure5FYHvzbaT6PLs8xpP3Ob7Z6-z--fJhECKxuf7KhUkijQXeLRY7Js_NSDxoeu60G00=@emersion.fr>
In-Reply-To: <20230411222931.15127-2-ville.syrjala@linux.intel.com>
References: <20230411222931.15127-1-ville.syrjala@linux.intel.com>
 <20230411222931.15127-2-ville.syrjala@linux.intel.com>
Feedback-ID: 1358184:user:proton
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Simon Ser <contact@emersion.fr>
